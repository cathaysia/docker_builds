FROM fedora

ADD requirements.txt /root
ADD .devcontainer/puppeteer-config.json  /puppeteer-config.json
RUN echo -e 'assumeyes=True\ninstall_weak_deps=False\ntsflags=nodocs' >> /etc/dnf/dnf.conf \
    # 安装 latex
    && dnf in make latexmk texlive-{xetex,xindy,cmap,xecjk,gnu-freefont,fncychap,wrapfig,capt-of,framed,upquote,needspace,tabulary,parskip,fandol,cancel,ctex,babel-english}\
        # mscgen
        mscgen \
        # plantuml
        plantuml graphviz pip wqy-microhei-fonts java-openjdk\
    # mermaid 和 wavedrom
    && dnf in fedora-workstation-repositories \
    && sed 's/enabled=0/enabled=1/g' -i /etc/yum.repos.d/google-chrome.repo \
    && dnf in google-chrome-stable yarnpkg nodejs /usr/bin/pdfcrop ghostscript\
    && yarn global add @mermaid-js/mermaid-cli wavedrom-cli \
    # 安装 pip 依赖项
    && dnf in python3-setuptools.noarch python3-matplotlib.x86_64 \
    && pip --no-cache-dir install -r /root/requirements.txt \
    # 清理
    && dnf autoremove \
    && dnf clean all

