ARG DEV_IMAGE

FROM $DEV_IMAGE AS nvim-builder

RUN mkdir build
WORKDIR build

RUN sudo apt update && \
    sudo apt install -y \
    ninja-build \
    gettext \
    cmake \
    unzip \
    curl

RUN git clone https://github.com/neovim/neovim.git

# RUN sudo apt update && \
#     sudo apt install -y \
#     ninja-build \
#     gettext \
#     cmake \
#     unzip \
#     curl && \
#     git clone https://github.com/neovim/neovim.git && \
#     cd neovim && \
#     make CMAKE_BUILD_TYPE=Release && \
#     sudo make install && \
#     sudo rm -rf /var/lib/apt/lists/*

# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash && \
#     echo "nvm install node" | bash
#
# WORKDIR ../
# RUN mkdir dev-tools
# WORKDIR dev-tools
# COPY . .
#
# # RUN ./script/install-zsh.sh
# RUN ./install.sh

WORKDIR ../
