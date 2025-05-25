ARG DEV_IMAGE
FROM $DEV_IMAGE AS dev

# NOTE: Requires that the workdir is set to the user directory

# Install development and debugging tools
# NOTE:
# - python3-pip and python3-venv required for neovim language server installation via mason
# - llvm used for debug adapter protocol /usr/bin/lldb-vscode-14
RUN sudo apt update --fix-missing && sudo apt -y install --no-install-recommends \
    less \
    fzf \
    ninja-build \
    gettext \
    cmake \
    unzip \
    curl \
    libstdc++-12-dev \
    python3-pip \
    python3-venv \
    zsh \
    llvm \
    xclip \
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

RUN sudo chsh -s /usr/bin/zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN mkdir -p .oh-my-zsh/plugins && \
    git clone https://github.com/zsh-users/zsh-autosuggestions .oh-my-zsh/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting .oh-my-zsh/plugins/zsh-syntax-highlighting

ARG USER

# omz moves the original .zshrc to .zshrc.pre-oh-my-zsh
RUN rm .zshrc # Remove oh-my-zsh generated config
COPY --chown=$USER:$USER dotfiles/.zshrc .zshrc
RUN cat .zshrc.pre-oh-my-zsh >> .zshrc && rm .zshrc.pre-oh-my-zsh

# Copy nvim-config and do a headless-run to install the plugins
# but remove afterwards since the config will be mounted
# TODO: Work out how to get this to pre-install language servers via mason

COPY nvim .config/nvim
RUN nvim --headless -V +qall
RUN sudo rm -rf .config/nvim

ARG GIT_NAME
ARG GIT_EMAIL
COPY  dotfiles/gitignore .config/gitignore
RUN git config --global core.excludesFile .config/gitignore && \
    git config --global user.name "$GIT_NAME" && \
    git config --global user.email "$GIT_EMAIL" && \
    git config --global pager.branch false
