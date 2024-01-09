ARG base=ghcr.io/anyakichi/dpdk-builder:main-cross
FROM ${base}

RUN \
    cd /etc/buildenv.d \
    && ls \
    && for i in build.* install.* setup.*; do \
        mv $i dpdk-$i; \
       done \
    ;  sed -i 's/buildenv setup/buildenv dpdk-setup/' /etc/buildenv.d/dpdk-build.40.md \
    && sed -i 's/buildenv setup/buildenv dpdk-setup/' /etc/buildenv.d/dpdk-install.40.md \
    && sed -i 's/buildenv build/buildenv dpdk-build/' /etc/buildenv.d/dpdk-install.40.md \
    && sed -i 's/^DOTCMDS="\?\([^"]*\)"\?/DOTCMDS="\1 dpdk-setup"/' /etc/buildenv.conf

COPY buildenv.d/ /etc/buildenv.d/

RUN \
    if [ -e /etc/buildenv.d/extract-sysroot.40.md ]; then \
        rm /etc/buildenv.d/setup.61.self.md; \
    else \
        rm /etc/buildenv.d/setup.61.cross.md; \
    fi

ARG dpdk_meson_opts=""
ARG dpdk_rev=v23.11
ARG meson_opts=""
ENV \
    DPDK_GIT_URL=https://dpdk.org/git/dpdk-stable \
    DPDK_MESON_OPTS=${dpdk_meson_opts} \
    DPDK_REV=${dpdk_rev} \
    MESON_OPTS=${meson_opts}
