ARG DEV_IMAGE
FROM $DEV_IMAGE AS dev

# NOTE: Running as user

# Install development and debugging tools
# NOTE: python3-pip and python3-venv required for neovim language server installation via mason
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
    python3-pip \
    python3-venv \
    && sudo apt clean && sudo rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/neovim/neovim.git && \
    cd neovim && \
    make CMAKE_BUILD_TYPE=Release && \
    sudo make install && \
    cd ../ && \
    rm -r neovim

# NPM required for language servers

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash && \
    . ~/.nvm/nvm.sh && \
    nvm install node

RUN echo "set -o vi" >> ~/.bashrc && \
    echo "source ~/.nvm/nvm.sh" >> ~/.bashrc
