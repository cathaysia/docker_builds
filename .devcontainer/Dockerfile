FROM dragontao/sphinx_mermaid:latest

RUN dnf in git xclip sudo \
    && pip --no-cache-dir install commitizen sphinx-autobuild -i https://pypi.mirrors.ustc.edu.cn/simple/

# 创建非特权用户

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # Add sudo support
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    # 创建路径
    && mkdir -p /home/$USERNAME/.vscode-server/extensions \
    && chown -R $USERNAME /home/$USERNAME/.vscode-server

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME
