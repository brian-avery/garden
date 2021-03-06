---
layout:     default
title:      "Debugging Containers With Stripped Binaries In Go"
date:       2018-09-19
author:     "Brian Avery"
categories:  ["Go", "Debugging", "Containers" ]
---

NOTE: These instructions rely on Delve 1.1.0

Sometimes it's necessary to strip debugging information before shipping binaries for space or security reasons. However, this can make it more painful to debug these containers if not done properly.


== Stripping Binaries

To see if your binary  is stripped, do:

[source, bash]
----
$ file crashdummy
crashdummy: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, with debug_info, not stripped
----

Notice in the example above that the file is listed as with debug_info and not stripped. We'd like to remove this. To fix this, run eu-strip. The -f argument tells eu-strip to save the debug information in another file.

[source,bash]
----
$ eu-strip crashdummy -f crashdummy.debug
----

Run the file command again and see the output has changed.
[source, bash]
----
$ file crashdummy
crashdummy: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, stripped
----

== Compiling Go with a GNU build-id
The build ID is a hash found in the header of a binary which is a unique identifier for a binary built from a specific environment and codebase. Go by default produces a build ID called '.note.go.buildid' but delve is looking for the one provided by GNU compilers (.note.gnu.build-id). We can add this to our go binary by doing a ``go build -ldflags=-linkmode=external``

== Debugging core files
Let's generate a core file using gcore to use in our example. Note that 1598 is our process ID. This will generate a core file and store it in our current directory. 

[source, bash]
----
$ pgrep crashdummy
28056

$ gcore 28056
----

== Opening the Core File
To open the core file in delve, execute the command below where core.28056 is the core file created by gcore. If you followed the instructions above and are running delve 1.1.0, then you should see something similar to the following:

[source, bash]
----
$ dlv core ./crashdummy core.28056
can't open separate debug file: open /usr/lib/debug/.build-id/78/62f6dfe5b2c2d46a7bc045d594c20739539353.debug: no such file or directory
----

This error means that the debug information is not attached. But we expected this. There's two ways of fixing this. We can either use eu-unstrip (eu-unstrip crashdummy crashdummy.debug) or we can keep our debug information separate. In this post, we'll follow the second example.

Copy the debug info to the path specified above and try again.

[source, bash]
----
$ dlv core ./crashdummy core.28056
Type 'help' for list of commands.
(dlv)
----

== Generating Less Contrived Core files
If you'd like to use this in a less contrived example, note that go by default does not generate core files. To get go to generate core files, set the environment variable GOTRACEBACK=crash. 
[source, bash]
----
GOTRACEBACK=crash ./crashdummy 
----

It may also be helpful to change kernel.core_pattern in /etc/sysctl.conf to store core files in a more useful location. Change this to "core" to generate them in the same directory as your binary. Execute sysctl -p to make it take effect.

== Attaching the debugger to a running process
As long as you???ve been following along so far, you have your debug info in the proper directory. Now, do a ``pgrep crashdummy`` to get your process ID and do a dlv attach. The debugger should now open.

[source, bash]
----
$ dlv attach 26343
Type 'help' for list of commands.
(dlv)
----

== Getting a stack trace
You can also print the stack trace

[source, bash]
----
dlv trace core.28056
Test World
Process 28056 has exited with status 0
----

Note that even with a stripped file, Go still gives us a useful stack trace

== Ok. But what about containers?

Let's take the binary we created above and throw it in a container called crashdummy:0.0.1

Docker containers are just processes right?

[source, bash]
----
$ ps aux | grep crashdummy
... 20552  ... /usr/bin/docker-current run crashdummy:0.0.1
$ dlv attach 20552
Type 'help' for list of commands.
(dlv)
----

Ok. That might work on a local system, but there's better ways of doing these things. Let's see how this can be done on OpenShift


=== Get our container
[source, bash]
----
$ oc get pods | grep crashdummy
crashdummy-dcc64f76d-cgfjj        1/1       Running       0          4s
----

=== Copy delve to the container
* Copy the delve debugger to the container
```
$ oc cp ~/go/bin/dlv crashdummy-dcc64f76d-cgfjj:/bin/dlv
```


=== Start Delve on the Container
* Find the PID of our binary
```
$ oc exec crashdummy-dcc64f76d-cgfjj ps | grep crashdummy
    1 ?        00:00:00 crashdummy
```

* Attempt to launch the debugger, which will tell us where our debuginfo needs to go
```
$ oc exec crashdummy-dcc64f76d-cgfjj -- dlv attach 1 --headless --listen=:40000 --log
could not attach to pid 1: can't open separate debug file: open /usr/lib/debug/.build-id/78/62f6dfe5b2c2d46a7bc045d594c20739539353.debug: no such file or directory
```

* Load our debug info into the container
```
$ oc exec crashdummy-dcc64f76d-cgfjj -- mkdir -p /usr/lib/debug/.build-id/78/
$ oc cp crashdummy.debug crashdummy-dcc64f76d-cgfjj:/usr/lib/debug/.build-id/78/62f6dfe5b2c2d46a7bc045d594c20739539353.debug
```

* Launch our debugger. For real this time.
```
$ oc exec crashdummy-dcc64f76d-cgfjj -- dlv attach 1 --headless --listen=:40000 --log
API server listening at: [::]:40000
time="2018-09-19T22:26:50Z" level=info msg="attaching to pid 1" layer=debugger
```

* Forward the delve debugger port so we can access it

```
$ oc port-forward crashdummy-dcc64f76d-cgfjj 40000:40000
```

* Finally, connect to the debugger

```
$ dlv connect 127.0.0.1:40000
Type 'help' for list of commands.
(dlv)
```

Now you can use delve just as you would locally. But all of your binaries in your container are stripped.

== Notes

At first I was running a previous version. If you run into this error, then you're most likely either running an old version of delve or you don't have the build-id in your binary.
[source, bash]
----
$ dlv core ./crashdummy core.28056
decoding dwarf section info at offset 0x0: too short
----









