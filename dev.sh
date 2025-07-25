#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

print_usage() {
cat <<EOF
Usage: $0 <devcontainer> <command>
EOF
}

if [ $# -ne 2 ]; then
    print_usage
    exit 1
fi

container_file="devcontainers/$1.sh"
if [[ ! -e $container_file ]]; then
    echo -e "${RED}Container file $container_file doesn't exist${NC}"
    exit 1
fi

source $container_file
for var in root_dir devcontainer_json user_config; do
    valid=true
    if [[ ! -v $var ]]; then
        echo -e "${RED}Invalid devcontainer config: Missing variable "$var"${NC}"
        valid=false
    fi
    if [[ "$valid" == "false" ]]; then
        exit 1
    fi
done

command=$2
case $command in
    build)
        devcontainer build \
            --workspace-folder $root_dir \
            --config "$root_dir/$devcontainer_json"
        ;;
    restart)
        devcontainer up \
            --workspace-folder $root_dir \
            --config "$root_dir/$devcontainer_json" \
            --remove-existing-container \
            --additional-features '{
                "ghcr.io/zachlambert/dev-tools/neovim": {}
            }' \
            --mount type=bind,source=$(pwd)/dotfiles/nvim,target=$user_config/nvim \
            --mount type=bind,source=$(pwd)/dotfiles/shell/shell,target=$user_config/shell \
            --mount type=bind,source=$(pwd)/dotfiles/shell/bash,target=$user_config/bash \
            --mount type=bind,source=$(pwd)/dotfiles/shell/zsh,target=$user_config/zsh \
            --mount type=bind,source=$(pwd)/dotfiles/shell/.bashrc,target=$user_config/../.bashrc \
            --mount type=bind,source=$(pwd)/dotfiles/shell/.zshrc,target=$user_config/../.zshrc \
            --mount type=bind,source=$(pwd)/dotfiles/setup.sh,target=$user_config/setup.sh \
            --mount type=bind,source=$(pwd)/dotfiles/git/gitignore,target=$user_config/gitignore \
            --mount type=bind,source=$HOME/.ssh,target=$user_config/../.ssh \
            --skip-post-create
        devcontainer exec \
            --workspace-folder $root_dir \
            --config "$root_dir/$devcontainer_json" \
            "/home/zach/.config/setup.sh"
        ;;
    start)
        devcontainer up \
            --workspace-folder $root_dir \
            --config "$root_dir/$devcontainer_json" \
            --additional-features '{
                "ghcr.io/zachlambert/dev-tools/neovim": {}
            }' \
            --mount type=bind,source=$(pwd)/dotfiles/nvim,target=$user_config/nvim \
            --mount type=bind,source=$(pwd)/dotfiles/shell/shell,target=$user_config/shell \
            --mount type=bind,source=$(pwd)/dotfiles/shell/bash,target=$user_config/bash \
            --mount type=bind,source=$(pwd)/dotfiles/shell/zsh,target=$user_config/zsh \
            --mount type=bind,source=$(pwd)/dotfiles/shell/.bashrc,target=$user_config/../.bashrc \
            --mount type=bind,source=$(pwd)/dotfiles/shell/.zshrc,target=$user_config/../.zshrc \
            --mount type=bind,source=$(pwd)/dotfiles/setup.sh,target=$user_config/setup.sh \
            --mount type=bind,source=$(pwd)/dotfiles/git/gitignore,target=$user_config/gitignore \
            --mount type=bind,source=$HOME/.ssh,target=$user_config/../.ssh \
            --skip-post-create
        ;;
    enter)
        devcontainer exec \
            --workspace-folder $root_dir \
            --config "$root_dir/$devcontainer_json" \
            zsh
        ;;
    *)
        echo -e "${RED}Unknown command $command${NC}"
        exit 1
esac
