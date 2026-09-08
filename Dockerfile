ARG base=ghcr.io/anyakichi/dpdk-builder:main-cross
FROM ${base}

# The documents of dpdk-builder are put under the dpdk- prefix, the
# inclusions among them as well, so that the documents of this image
# can include them by that name and be the extract, setup and build of
# their own.
RUN \
    cd /etc/buildenv.d \
    && for i in *; do \
        mv "$i" "dpdk-$i"; \
       done \
    && sed -i -E 's/(\{%-?[[:space:]]*include[[:space:]]+)/\1dpdk-/' *

COPY buildenv.d/ /etc/buildenv.d/

ARG dpdk_meson_opts=""
ARG dpdk_rev=v25.11
ARG meson_opts=""
ENV \
    DPDK_GIT_URL=https://dpdk.org/git/dpdk-stable \
    DPDK_MESON_OPTS=${dpdk_meson_opts} \
    DPDK_REV=${dpdk_rev} \
    MESON_OPTS=${meson_opts}
