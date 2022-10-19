# DevOps Command Tools

- Install: `bash devops_command.sh.sh --install`
- Uninstall: `bash devops_command.sh.sh --uninstall`

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

#### kdelforce

Force delete all pods in a namespace.

#### kexecroot

Force connect to a pod with root user.

#### kndefault

Change default namespace.

#### kscale

Easy scaling control of everything in a namespace.
```
$ kscale deploy dev 0
[INFO] Scale deploy deploy-nginx-1 to 0
[INFO] Scale deploy deploy-nginx-2 to 0
[INFO] Scale deploy deploy-nginx-3 to 0
[INFO] Scale deploy deploy-nginx-4 to 0
```

#### ksecret

Show the contents of secrets with base64 decode.

## Utilities

#### outputlog

Easy format for log in your scripts.

```
$ outputlog "INFO" "This is a example"
2002-10-19 01:08:37 [INFO] This is a example
```

#### pomodoro

Simple Pomodorofor your shell.

```
$ pomodoro 1
Pomodoro start: 1 minutes
  Time left: (\) 0:59
```

#### tarparts

Script for compress one path in multiple files tar.gz in multi-threaded mode.

```
$ tarparts 3 /home/testdir testfile
```