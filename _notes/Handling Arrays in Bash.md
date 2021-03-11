---
---

The following script allows to call watch_tasks with the array foo. $[@] expands the array, which gets passed as an argument.  `($a)` then takes all args passed to the function and combines them all into rpms. This can then be used.

```
#!/bin/sh

a=false
function watch_tasks() {
    rpms=("${@}")
    # watch all tasks and brew will end with exit 0 when all tasks are done
    echo "Watching ${rpms[@]}"
    if [ "${a}" = "false" ]; then
        a="true"
        echo "go again"
        watch_tasks "${rpms[@]}"
    fi
}

foo=(1 2 4 8 16 32 64 128)
watch_tasks "${foo[@]}"
```