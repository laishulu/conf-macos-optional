#!/usr/bin/env bash

root_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && cd .. && pwd)

# install sarasa fonts

if fc-list 2>&1 | grep -q "Sarasa"; then
	cp -rvf "$root_dir/macos/optional/fonts/*.ttf" ~/Library/Fonts
	fc-cache -f -v ~/Library/Fonts
fi

if [[ $overwrite == "yes" ]]; then
	open "$root_dir/macos/optional/Monokai-pro.terminal"
fi

if [[ $macos_keymap = "switch" ]]; then
	brew cask install karabiner-elements
	if ! [[ -e ~/.config/karabiner/karabiner.json ]]; then
		mkdir -p ~/.config/karabiner
		ln -sf $root_dir/macos/optional/karabiner.json ~/.config/karabiner/karabiner.json
	fi
fi
