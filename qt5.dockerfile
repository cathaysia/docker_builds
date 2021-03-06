FROM fedora

RUN echo -e 'assumeyes=True\ninstall_weak_deps=False\ntsflags=nodocs' >> /etc/dnf/dnf.conf \
    && dnf install /usr/bin/xargs \
    && dnf search qt5 devel | grep '^qt5' | awk '{print $1}' | grep x86_64 | xargs -I {} sudo dnf install {} \
    && dnf search kf5 devel | awk '{print $1}' | grep x86_64 | xargs -I {} sudo dnf install {} \
    && dnf install digikam-devel.x86_64 \
    && dnf install gcc gcc-c++ cmake ninja-build make extra-cmake-modules\
    && dnf autoremove \
    && dnf clean all
