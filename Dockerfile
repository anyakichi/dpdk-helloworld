FROM ghcr.io/anyakichi/dpdk-builder:main

RUN \
    mv /etc/buildenv.d/build.40.md /etc/buildenv.d/dpdk-build.40.md \
    && mv /etc/buildenv.d/install.40.md /etc/buildenv.d/dpdk-install.40.md \
    && mv /etc/buildenv.d/setup.40.md /etc/buildenv.d/dpdk-setup.40.md \
    && sed -i 's/buildenv setup/buildenv dpdk-setup/' /etc/buildenv.d/dpdk-build.40.md \
    && sed -i 's/buildenv setup/buildenv dpdk-setup/' /etc/buildenv.d/dpdk-install.40.md \
    && sed -i 's/buildenv build/buildenv dpdk-build/' /etc/buildenv.d/dpdk-install.40.md \
    && sed -i 's/^DOTCMDS="\?\([^"]*\)"\?/DOTCMDS="\1 dpdk-setup"/' /etc/buildenv.conf

COPY buildenv.d/ /etc/buildenv.d/

ARG dpdk_meson_opts=""
ARG dpdk_rev=v23.11
ENV \
    DPDK_GIT_URL=https://dpdk.org/git/dpdk-stable \
    DPDK_MESON_OPTS=${dpdk_meson_opts} \
    DPDK_REV=${dpdk_rev}
