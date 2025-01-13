ARG DEV_IMAGE
FROM $DEV_IMAGE AS dev

# NOTE: Running as user

# Install development and debugging tools
RUN sudo apt update --fix-missing && sudo apt -y install --no-install-recommends \
    less \
    fzf \
    ninja-build \
    gettext \
    cmake \
    unzip \
    curl \
    clangd-14 \
    stow \
    && sudo apt clean && sudo rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/neovim/neovim.git && \
    cd neovim && \
    make CMAKE_BUILD_TYPE=Release && \
    sudo make install && \
    cd ../ && \
    rm -r neovim

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash && \
    . ~/.nvm/nvm.sh && \
    nvm install node

RUN echo "set -o vi" >> ~/.bashrc && \
    echo "source ~/.nvm/nvm.sh" >> ~/.bashrc

RUN . ~/.nvm/nvm.sh && \
    npm i -g pyright && \
    npm i -g bash-language-server

