#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

apt update
apt install -y curl bash

curl -fsSL https://claude.ai/install.sh | bash
