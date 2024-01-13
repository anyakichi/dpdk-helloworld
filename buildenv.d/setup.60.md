Check the current directory.

```
$ [[ \$WORKDIR == \$PWD ]] || return 0
```

Install DPDK.

```
$ buildenv dpdk-install -y
```

Switch to dpdk-helloworld directory.

```
$ cd dpdk-helloworld
```
