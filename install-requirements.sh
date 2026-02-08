#!/bin/bash

echo "Starting installation..."

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected macOS. Installing with Homebrew..."
    
    if ! command -v brew &> /dev/null; then
        echo "Error: Homebrew is not installed."
        exit 1
    fi

    brew update
    # GUI applications usually via cask
    brew install --cask kitty ghostty
    # CLI tools
    brew install tmux yazi neovim fish

elif [ -f /etc/arch-release ]; then
    echo "Detected Arch Linux. Installing with pacman..."
    
    # Update and install
    sudo pacman -Syu --noconfirm kitty ghostty tmux yazi neovim fish

elif grep -qi "ubuntu" /etc/os-release; then
    echo "Detected Ubuntu. Installing with apt..."
    
    sudo apt update
    # Note: ghostty and yazi might not be in default Ubuntu repositories
    # but strictly following instructions to use apt.
    sudo apt install -y kitty ghostty tmux yazi neovim fish

else
    echo "Unsupported OS detected. This script supports macOS, Arch, and Ubuntu."
    exit 1
fi

echo "Installation sequence finished."
