Check distribution type.

```
$ case "${CROSS_IMAGE}" in \
    archlinux*) CROSS_DISTRO=archlinux;; \
    debian*|ubuntu*) CROSS_DISTRO=debian;; \
    almalinux*|fedora*|rockylinux*) CROSS_DISTRO=fedora;; \
    *) CROSS_DISTRO=;; \
  esac
```

Execute meson in dpdk directory.

```
$ if [[ ! -e ../target ]]; then \
    meson setup ${MESON_OPTS} --native-file /assets/meson/common.txt build; \
  elif [[ -z "${CROSS_ARCH}" || "${CROSS_ARCH}" == $(uname -m) ]]; then \
    meson setup ${MESON_OPTS} \
        --pkg-config-path /build/target/usr/local/lib/pkgconfig \
        --native-file /assets/meson/common.txt \
        --native-file /assets/meson/sysroot.txt \
        --native-file /assets/meson/arch_$(uname -m).txt \
        --native-file /assets/meson/distro_\${CROSS_DISTRO}.txt \
        build; \
  else \
    meson setup ${MESON_OPTS} \
        --pkg-config-path /build/target/usr/local/lib/pkgconfig \
        --cross-file /assets/meson/common.txt \
        --cross-file /assets/meson/sysroot.txt \
        --cross-file /assets/meson/arch_${CROSS_ARCH}.txt \
        --cross-file /assets/meson/distro_\${CROSS_DISTRO}.txt \
        build; \
  fi
```
