FROM python:slim
EXPOSE 5550
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends tmux gdb\
    && pip install gdbfrontend \
    && apt-get autoremove \
    && apt-get clean \
ENTRYPOINT ['gdbfrontend']
