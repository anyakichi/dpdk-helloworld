{% if "${PWD}" == "${WORKDIR}" -%}

{% include dpdk-install %}

Switch to the dpdk-helloworld directory.

```
$ cd ../dpdk-helloworld
```

Execute meson setup.  In the cross image, the machine file written
for DPDK is used, so that helloworld is built against the same
sysroot, or with the same compiler, as DPDK was.

```
{% if "${CROSS_IMAGE:-}" -%}
$ meson setup --cross-file ../meson-cross.txt ${MESON_OPTS} build
{%- elif "$(command -v meson-machine-file)" -%}
$ meson setup --native-file ../meson-native.txt ${MESON_OPTS} build
{%- else -%}
$ meson setup ${MESON_OPTS} build
{%- endif %}
```

{% endif %}
