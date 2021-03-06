---
layout:     default
title:      "Debugging Containers With Stripped Binaries In C++"
date:       2018-09-19
author:     "Brian Avery"
tags:  ["c plus plus", "debugging", "containers" ]
---

Sometimes it's necessary to strip debugging information before shipping binaries for space or security reasons. However, this can make it more painful to debug these containers if not done properly.

== Stripping Binaries
NOTE: Make sure to build binaries with debug info included: `g++ -ggdb main.cpp -o crashdummycpp` This is included by default in Go, but not in C++. Either way, when the binary gets stripped, everything is moved to the .debug file.

Lets view the information about our binary.
[source, bash]
----
file crashdummycpp
crashdummycpp: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=2f2a7e0053f53c1a9d2816f67e50077d22872aeb, with debug_info, not stripped
----

Notice in the example above that the file is listed as with debug_info and not stripped. We'd like to remove this from the binaries we ship. To fix this, run eu-strip. The -f argument tells eu-strip to save the debug information in another file.

[source,bash]
----
$ eu-strip crashdummycpp -f crashdummycpp.debug
----

Run the file command again and see the output has changed.
[source, bash]
----
$ file crashdummycpp
crashdummycpp: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=2f2a7e0053f53c1a9d2816f67e50077d22872aeb, stripped
----

== Debugging core files
Let's generate a core file using gcore to use in our example. Note that 994 is our process ID. This will generate a core file and store it in our current directory.

[source, bash]
----
$ pgrep crashdummycpp
994

$ gcore 994
----

== Opening the Core File
To open the core file in gdb, execute the command below where core.994 is the core file created by gcore.

[source, bash]
----
$ gdb crashdummycpp core.994
----

GDB expects to find your .debuginfo file in the same directory as your binary. In our case, our binary is called crashdummycpp so gdb looks for crashdummycpp.debug.



== Attaching the debugger to a running process
As long as you???ve been following along so far, you have your debug info in the proper directory. Now, do a ``pgrep crashdummy`` to get your process ID and do a gdb -p. The debugger should now open.

[source, bash]
----
$ pgrep crashdummycpp
994

$ gdb -p 994
----

== Ok. But what about containers?

Let's take the binary we created above and throw it in a container called crashdummy:0.0.1

Docker containers are just processes right?

[source, bash]
----
$ ps aux | grep crashdummy
... 8040  ...  /usr/bin/docker-current run crashdummycpp:0.0.1
$ gdb -p 8040
----

Ok. That might work on a local system, but there's better ways of doing these things. Let's see how this can be done on OpenShift


=== Get our container
[source, bash]
----
$ oc get pods | grep crashdummycpp
crashdummycpp-65877bd997-jsl7j   1/1       Running   0          1m
----

=== Install GDB server in the container
* Install gdbserver in the container (assuming scc anyuid is present)
```
$ oc exec -it crashdummycpp-65877bd997-vd4wb /bin/sh
$ yum install gdb-gdbserver
```

=== Start GDB Server on the Container
* Find the PID of our binary
```
$ oc exec crashdummycpp-65877bd997-jsl7j -- ps aux | grep crashdummycpp
1000120+     1  0.0  0.0  12548   140 ?        Ss   02:16   0:00 /usr/bin/crashdummycpp
```

* Launch gdbserver
```
$ oc exec  crashdummycpp-65877bd997-jsl7j -- gdbserver --attach :40000 1
```

* Forward the debugger port so we can access it

```
$ oc port-forward crashdummycpp-65877bd997-jsl7j 40000:40000
```

* Now connect to the debugger

```
$ gdb
(gdb) target remote 127.0.0.1:40000
(gdb) symbol-file crashdummycpp.debug
```

Now you can use gdb just as you would locally. But all of your binaries in your container are stripped.

