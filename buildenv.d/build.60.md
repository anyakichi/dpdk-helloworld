{% include setup -%}

Do build.

```
{% if "$(command -v meson-cross-env)" -%}
$ $(meson-cross-env) ninja -C build
{%- else -%}
$ ninja -C build
{%- endif %}
```
