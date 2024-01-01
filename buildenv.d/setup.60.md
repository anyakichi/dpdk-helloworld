Check the current directory.

```
$ [[ ${PWD##*/} == dpdk-helloworld ]] && return 0
```

Install DPDK.

```
$ buildenv dpdk-install -y
```

Execute meson in dpdk directory.

```
$ cd dpdk-helloworld
$ meson setup build
```
