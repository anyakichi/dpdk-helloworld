Execute meson setup.

```
$ meson setup \
    $([ -e /build/target ] && echo --pkg-config-path /build/target/usr/local/lib/pkgconfig:/build/target/usr/local/lib/x86_64-linux-gnu/pkgconfig) \
    $(meson-cross-opts "${CROSS_ARCH}" "${CROSS_IMAGE}") ${MESON_OPTS} build
```
