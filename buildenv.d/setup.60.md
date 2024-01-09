Check the current directory.

```
$ [[ ${PWD##*/} == dpdk-helloworld ]] && return 0
```

Install DPDK.

```
$ buildenv dpdk-install -y
```

Switch to dpdk-helloworld directory.

```
$ cd dpdk-helloworld
```
