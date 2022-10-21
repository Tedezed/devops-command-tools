# DevOps Command Tools

- Install: `bash devops_command.sh.sh --install`
- Install for Docker (Only scripts): `bash devops_command.sh.sh --install-docker`
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

#### kexec

Force connect to a pod with root user or connect to node pool with option `--ssh`.

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

#### killgrep

Kill with name not PID.

```
$ ps -aux | grep terminator
ubuntu    8443  0.0  0.4 434654 238349 ?        Sl   01:30   0:04 /usr/bin/python3 /usr/bin/terminator
ubuntu   34555  0.0  0.0  0349  993944 pts/1    S+   11:33   0:00 grep --color=auto terminator

$ killgrep terminator
```

#### outputlog

Easy format for log in your scripts.

```
$ outputlog "INFO" "This is a example"
2002-10-19 01:08:37 [INFO] This is a example
```

#### pomodoro

Simple pomodoro timmer your shell.

```
$ pomodoro 1
Pomodoro start: 1 minutes
  Time left: (\) 0:59
```

#### tarparts

Script for compress one path in multiple files tar.gz in multi-threaded mode.

```
# Example: Compress in three files with name testfile the directory testdir
$ tarparts 3 /home/testdir testfile
```

#### trycommand

Execute a command and if it fails retry it a number of times.

```
$ trycommand -s 2 -t 3 -c "psql -h 192.168.1.5 -U tedezed -d animals"
psql: error: could not connect to server: No route to host
        Is the server running on host "192.168.1.5" and accepting
        TCP/IP connections on port 5432?
psql: error: could not connect to server: No route to host
        Is the server running on host "192.168.1.5" and accepting
        TCP/IP connections on port 5432?
psql: error: could not connect to server: No route to host
        Is the server running on host "192.168.1.5" and accepting
        TCP/IP connections on port 5432?
```