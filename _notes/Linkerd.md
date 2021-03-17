---
title: "Linkerd"
tags: [linkerd, service-mesh]
---

> Istio is focused on features, even at the expense of complexity. Linkerd is focused on simplicity, even at the expense of features. -[1]

* Implements SMI for some APIs


## Install

``` bash
curl -sL https://run.linkerd.io/install | sh
export PATH=$PATH:~/.linkerd2/bin/linkerd
```

## Components
* **sidecar** runs alongside the application in the same pod. It intercepts traffic. This follows the Kubernetes [[sidecar pattern]]. In Linkerd's case, this is the [Linkerd2-proxy](https://github.com/linkerd/linkerd2-proxy). Linkerd2-proxy uses iptables rules to intercept traffic and force it through the proxy. The iptables rules are configured through [Linkerd2-proxy-init](https://github.com/linkerd/linkerd2-proxy-init) which is a Kubernetes [init container](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/). Modifying iptables requires `NET_ADMIN`
* **control plane**: contains the configuration of sidecars and lives outside of the main traffic flow 
   * web UI
* **data plane**: intercepts the main traffic flow in order to provide observability, security, and reliablity features.


## Features
* load balancing -- Kubernetes load balances at the **connection** level. Linkerd balances at the **request** level. This jemans that once a connection between pods is established,r equests will continue to be sent over that connection until the client requests a new connection. Linkerd maintains a **connection pool** and distributes requests across this pool. By default, this distribution is done based on latency using an [expontentially weighted moving average](https://medium.com/@abhinav.mahapatra10/beginners-ml-basics-exponentially-weighted-moving-average-8ce3e75768f6). Load balancing happens client (source) side rather than server(destination) side.
* Metrics are captured by the proxy. Linkerd's Prometheus scrapes teh endpoints of all proxies and aggregates the metrics. The metrics endpoint can also be contacted directly for debugging.
* Linkerd has full support for HTTP/1.1, HTTP2, and gRPC. If it's not using one of these protocols, Linkerd will only proxy the request as a raw TCP stream and collect byte level metrics.
* mTLS -- not just encryption between two pods running the Linkerd proxy, but identity as well
## Injection
* Kubernetes `linkerd.io/inject: enabled` annotation on the workload or namespace.
* Manually modify the YAML to add the proxy and related components

---
## Review Later
* https://www.infoq.com/presentations/Simple-Made-Easy/
* https://medium.com/@abhinav.mahapatra10/beginners-ml-basics-exponentially-weighted-moving-average-8ce3e75768f6
* https://kubernetes.io/blog/2018/11/07/grpc-load-balancing-on-kubernetes-without-tears/
* https://eng.uber.com/microservice-architecture/
* https://acmbytecast.podbean.com/e/shwetak-patel-episode-7/
* https://acmbytecast.podbean.com/e/don-knuth-episode-2/

---

## References:
* [Edx Course](https://www.edx.org/course/introduction-to-service-mesh-with-linkerd)
* [Linkerd.io](https://linkerd.io/)
