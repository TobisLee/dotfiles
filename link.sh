#!/bin/bash

# Ensure the script stops on errors
set -e

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# --- Core Function: Create Symlink ---
# Usage: create_symlink "absolute_source_path" "absolute_target_path"
create_symlink() {
    local src="$1"
    local dest="$2"
    local dest_dir
    dest_dir=$(dirname "$dest")

    # 1. Check if source exists
    if [ ! -e "$src" ] && [ ! -d "$src" ]; then
        echo "⚠️  Warning: Source '$src' not found. Skipping."
        return
    fi

    # 2. Create destination parent directory if needed
    if [ ! -d "$dest_dir" ]; then
        echo "📂 Creating directory: $dest_dir"
        mkdir -p "$dest_dir"
    fi

    # 3. Check existing destination
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        # Check if it's currently a symlink
        if [ -L "$dest" ]; then
            # Check where the link points
            local current_link_target
            # Use readlink to get the target
            current_link_target=$(readlink "$dest")
            
            # If it already points to the correct source, skip
            if [ "$current_link_target" = "$src" ]; then
                echo "👌 $dest is already correctly linked."
                return
            else
                echo "🔄 Updating link for $dest"
                rm "$dest"
            fi
        else
            # It's an existing file or directory, back it up
            echo "📦 Backing up existing $dest to ${dest}.backup"
            mv "$dest" "${dest}.backup"
        fi
    fi

    # 4. Create the symbolic link
    echo "🔗 Linking $src -> $dest"
    ln -s "$src" "$dest"
}

# --- Helper: Link Dotfile ---
# Usage: link_file "source_file_relative_to_dotfiles" "target_full_path"
link_file() {
    local src="$DOTFILES_DIR/$1"
    local dest="$2"
    create_symlink "$src" "$dest"
}

link_file "tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
link_file "ghostty/config" "$HOME/.config/ghostty/config"
link_file "nvim/init.lua"  "$HOME/.config/nvim/init.lua"
link_file "fish/completions"  "$HOME/.config/fish/completions"
link_file "fish/config.fish"  "$HOME/.config/fish/config.fish"
link_file "fish/common.fish"  "$HOME/.config/fish/common.fish"
link_file "fish/conf.d/common_abbrs.fish"  "$HOME/.config/fish/conf.d/common_abbrs.fish"

# This condition is wrong, but use it for now
if [[ "$(uname)" == "Darwin" ]]; then
	link_file "../home_cfg/git/config" "$HOME/.gitconfig"
	link_file "../home_cfg/fish/conf.d/home_abbrs.fish"  "$HOME/.config/fish/conf.d/home_abbrs.fish"
	link_file "../home_cfg/fish/home.fish"  "$HOME/.config/fish/home.fish"
	link_file "../home_cfg/fish/functions/fish_prompt.fish"  "$HOME/.config/fish/functions/fish_prompt.fish"
else
	# Work condition for now
	echo "a"
fi

if [[ "$(uname)" != "Darwin" ]]; then
    # lazygit (Link to standard XDG location)
    link_file "lazygit/config.yml" "$HOME/.config/lazygit/config.yml"
else
    link_file "lazygit/config.yml" "$HOME/Library/Application Support/lazygit/config.yml"
fi
