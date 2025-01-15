ARG DEV_IMAGE
FROM $DEV_IMAGE AS dev

# NOTE: Running as user

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
    
# ZSH
# NOTE: Currently disabling zshrc, there's various things setup for bash only
# which aren't worth replicating at the moment

# RUN sudo chsh -s /usr/bin/zsh
# RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 
# ARG USERNAME
# RUN mkdir -p /home/$USERNAME/.oh-my-zsh/plugins && \
#     git clone https://github.com/zsh-users/zsh-autosuggestions /home/$USERNAME/.oh-my-zsh/plugins/zsh-autosuggestions && \
#     git clone https://github.com/zsh-users/zsh-syntax-highlighting /home/$USERNAME/.oh-my-zsh/plugins/zsh-syntax-highlighting

# COPY dotfiles/.zshrc /home/$USERNAME/.zshrc

# Copy nvim-config and do a headless-run to install the plugins
# but remove afterwards since the config will be mounted
# TODO: Work out how to get this to pre-install language servers via mason

COPY nvim /home/$USERNAME/.config/nvim
RUN nvim --headless -V +qall
RUN sudo rm -rf /home/$USERNAME/.config/nvim

ARG GIT_NAME
ARG GIT_EMAIL
COPY  dotfiles/gitignore /home/$USERNAME/.config/gitignore
RUN git config --global core.excludesFile /home/$USERNAME/.config/gitignore && \
    git config --global user.name "$GIT_NAME" && \
    git config --global user.email "$GIT_EMAIL"

# Replicate extra .bashrc statements in .zshrc

# Persist the command history
# ARG CMD_HIST_LOCATION=/commandhistory
# RUN mkdir -p $CMD_HIST_LOCATION \
#     && touch $CMD_HIST_LOCATION/.zsh_history \
#     && echo "export PROMPT_COMMAND='history -a' && export HISTFILE=$CMD_HIST_LOCATION/.zsh_history" >> "/home/$USERNAME/.zshrc" 
# 
# RUN sudo chmod +x /entrypoint.sh && \
#     echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh" >> /home/${USERNAME}/.zshrc && \
#     echo "source /opt/ros/${ROS_DISTRO}/setup.zsh" && \
#     echo "export $(grep -E '^(RMW_IMPLEMENTATION|ROS_DOMAIN_ID)=' /ros2_ws/src/platform_io/docker/.env | sed 's/#.*//' | xargs)" >> /home/${USERNAME}/.zshrc && \
#     echo "export RMW_IMPLEMENTATION=${RMW_IMPLEMENTATION:-rmw_fastrtps_cpp}" >> /home/${USERNAME}/.zshrc && \
#     echo "export ROS_DOMAIN_ID=${ROS_DOMAIN_ID:-0}" >> /home/${USERNAME}/.zshrc && \
#     echo "export CMAKE_EXPORT_COMPILE_COMMANDS=ON" >> /home/${USERNAME}/.zshrc
