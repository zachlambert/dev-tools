FROM rust:1.74

ARG USER
ARG UID
ARG GID

RUN groupadd -g $GID $USER
RUN useradd $USER -u $UID -g $GID -m -s /bin/bash

USER $USER
WORKDIR /home/$USER
