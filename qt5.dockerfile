FROM fedora

RUN echo -e 'assumeyes=True\ninstall_weak_deps=False\ntsflags=nodocs' >> /etc/dnf/dnf.conf \
    && dnf search qt5 devel | grep '^qt6' | awk '{print $1}' | grep x86_64 | xargs -I {} sudo dnf install {} \
    && dnf search kf5 devel | awk '{print $1}' | grep x86_64 | xargs -I {} sudo dnf install {} \
    && dnf install digikam-devel.x86_64 \
    && dnf autoremove \
    && dnf clean all
