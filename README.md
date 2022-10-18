# DevOps Command Tools

Install: `bash install.sh`

## Kubernetes

#### kall

Execute one command in all context.

```
$ kall get pod -n dev 
[gke_xxxxxxxxxxx]
NAME               READY   STATUS    RESTARTS   AGE
pod-xxxxxxxxxxxx   1/1     Running   0          15m

[aks_xxxxxxxxxxx]
NAME               READY   STATUS    RESTARTS   AGE
pod-xxxxxxxxxxxx   1/1     Running   0          15m

[eks_xxxxxxxxxxx]
NAME               READY   STATUS    RESTARTS   AGE
pod-xxxxxxxxxxxx   1/1     Running   0          15m
```

#### kcontext

Kubernetes context selector.

```
$ kcontext 
Current: gke_xxxxxxxxxxx

List of contexts:
[0] gke_xxxxxxxxxxx
[1] aks_xxxxxxxxxxx
[2] eks_xxxxxxxxxxx

Context number to switch: 
```