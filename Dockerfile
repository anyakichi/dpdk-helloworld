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

# DPDK builds for the machine it is built on unless told otherwise, and
# the platform is set to generic here so that the binaries of this image
# run on any machine of the architecture.  A cross build takes what it
# builds for from the cross file, and the option does nothing there.
ARG dpdk_meson_opts="-Dplatform=generic"
ARG dpdk_rev=v25.11
ARG meson_opts=""
ENV \
    DPDK_MESON_OPTS=${dpdk_meson_opts} \
    DPDK_REV=${dpdk_rev} \
    MESON_OPTS=${meson_opts}
