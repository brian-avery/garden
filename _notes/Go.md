---
title: "Go"
tags: [programming, go]
stage: budding
---

## Overriding Repos in Go.mod [^1]

Go defaults to using the public Go module mirror `goproxy.io` and validating modules against the public Go checksum database at `sum.golang.org`. However, when Go source code is not available publicly, this needs to be overridden using environment variables. 

* Skip the Go proxy using `direct`. Proxy can also be overridden with a URL. This is a comma separated list.

```
export GOPROXY=https://goproxy.io,direct
```

* You can mark packages private using `GOPRIVATE` which will set both `GONOPROXY` and `GONOSUMDB`.  
```
export GOPRIVATE=git.mycompany.com,github.com/my/private
```

* Finally, if you normally have source code public and need to override, you can do so by comining with `insteadof` in gitconfig

```
[url "git@github.com:"\]
	insteadOf = https://github.com/
```


***
_References_

[1]:https://goproxy.io/