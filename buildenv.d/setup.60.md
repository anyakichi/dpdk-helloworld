{% if "${PWD}" == "${WORKDIR}" -%}

{% include dpdk-install %}

Switch to the dpdk-helloworld directory.

```
$ cd ${WORKDIR}/dpdk-helloworld
```

Execute meson setup.  In the cross image, the environment and the
machine files of DPDK are used, so that helloworld is built against
the same sysroot, or with the same compiler, as DPDK was.

```
{% if "$(command -v meson-cross-env)" -%}
$ $(meson-cross-env) meson setup $(meson-cross-opts) ${MESON_OPTS} build
{%- else -%}
$ meson setup ${MESON_OPTS} build
{%- endif %}
```

{% endif %}
