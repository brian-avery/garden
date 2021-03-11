---
title: "SPIFFE"
keywords:
  - #security
  - #attestation
  - #spiffe
---

## SPIFFE
SPIFFE is the **S**ecure **P**roduction **I**dentity **F**ramework **F**or **E**veryone. It provides a standard for secure identities using custom [[X.509 certificates]] provided to every workload. This removes the need for application-level [[Authentication]] and [[Authorization]]. 

### Integration
* [Envoy](https://blog.envoyproxy.io/securing-the-service-mesh-with-spire-0-3-abb45cd79810)

## SPIRE
Spire is a SPIFFE implementation. It provides platform and workload attestation, an API for controlling attestation policies, and coordinates certificate issuance and rotation. 

### Deploying Spire to OpenShift

Initially, spire-agent fails to deploy. If you skip ahead and ignore this, then the `/run/spire/sockets` wil not be available and pods looking for it as a volume mount will not start. 

``` 
kubectl describe daemonset --namespace spire

  Warning  FailedCreate  2m19s (x59 over 4h23m)  daemonset-controller  Error creating: pods "spire-agent-" is forbidden: unable to validate against any security context constraint: [provider restricted: .spec.securityContext.hostNetwork: Invalid value: true: Host network is not allowed to be used provider restricted: .spec.securityContext.hostPID: Invalid value: true: Host PID is not allowed to be used spec.volumes[2]: Invalid value: "hostPath": hostPath volumes are not allowed to be used spec.initContainers[0].securityContext.hostNetwork: Invalid value: true: Host network is not allowed to be used spec.initContainers[0].securityContext.hostPID: Invalid value: true: Host PID is not allowed to be used spec.containers[0].securityContext.hostNetwork: Invalid value: true: Host network is not allowed to be used spec.containers[0].securityContext.hostPID: Invalid value: true: Host PID is not allowed to be used]

```
* Spire needs the `hostaccess`  [SCC](https://www.openshift.com/blog/managing-sccs-in-openshift) [#447](https://github.com/greymatter-io/helm-charts/issues/447)
```
 oc adm policy add-scc-to-user hostaccess spire-agent -n spire
```
* SDS support is enabled in SPIRE by default. gm

>  In other words, SPIRE’s rich methods of defining and attesting services can be used to target the Envoy process, define an identity for it, and provide it with X.509 certificates and trust information that Envoy can use for TLS communication.

![A high-level diagram of two Envoy proxies sitting between two services using the SPIRE Agent SDS implementation to obtain secrets for mutually authenticated TLS communication.](https://spiffe.io/img/spire_plus_envoy.png)

***
## References:
* [SPIFFE.io](https://spiffe.io/#)