FROM python:slim
EXPOSE 5550
RUN apt update -y \
    && apt install -y --no-install-recommends tmux \
    && pip install gdbfrontend \
    && apt autoremove \
    && apt-get clean \
ENTRYPOINT ["w2", "run", "-M","prod", "-D","/whistle"]
