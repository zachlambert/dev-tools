FROM rust:1.74

RUN apt update && apt install -y \
    sudo && \
    rm -rf /var/lib/apt/lists/*

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ARG USER
ARG UID
ARG GID

RUN groupadd -g $GID $USER
RUN useradd $USER -u $UID -g $GID -m -s /bin/bash
RUN adduser $USER sudo

USER $USER
WORKDIR /home/$USER
