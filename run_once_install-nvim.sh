#! /bin/bash

if [ ! -d "~/.local/share/nvim/site/pack/packer/" ]; then
	# Download packer
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	~/.local/share/nvim/site/pack/packer/start/packer.nvim


	# Install plugin
	nvim --headless -c "PackerSync"
fi
