---
title: "Service Mesh"
tags: [service mesh]

---

## Why?

## Ideas
* [[Observability]]
* [[Reliability]]
* [[Security]]

## Implementations
[[Istio]]
[[Linkerd]]

* [[ServiceMeshInterface]]

## Debugging
```
pkg/source/kube/dynamic/source.go:141: watch of \*unstructured.Unstructured ended with: Underlying Result Channel closed
```
This is a pre-2.0.3/1.1.13 error message and means that the connection to the API server was broken (most likely because of the watch using a resource version which is no longer valid).  The error causes the multi namespace list watcher to reconnect to the API server and retrieve the resources.  The error is harmless and is reported by the cache layer so not something we can easily control.

```
{
  "level": "info",
  "logger": "servicemeshmemberroll-controller",
  "msg": "skipping reconciliation because mesh is not in a known good state",
}
```
In reconcilation, first the SMCP is reconciled and the cluster brought up to meet that configuration. Once that's complete, the operator reads the `ServiceMeshMember`/`ServiceMeshMemberRoll`  in order to figure out what projects belong to the cluster. In this case, the SMCP was reconciled, but one or more members of the control plane were not ready. This message indicates that the reconciliation of the `ServiceMeshMemberRoll` is being skipped until the control plane is in a good state. 

```
gRPC config stream closed: 14, upstream connect error or disconnect/reset before headers. reset reason: connection failure

Mixer Report failed with: UNAVAILABLE:upstream connect error or 

disconnect/reset before headers. reset reason: connection termination
```
These log messages indicate that the pods lost contact with Istiod. This is often by design as Istio disconnects from proxy periodically in order to reconnect and balance across the existing pilot/istiod pods. 