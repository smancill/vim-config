#!/bin/bash

VIMDIR="${HOME}/.vim"
VIMRC="${HOME}/.vimrc"
GVIMRC="${HOME}/.gvimrc"

cd "${VIMDIR}"

# Create directory for bundles
mkdir -p bundle

# Install package manager
if [[ -d bundle/neobundle.vim ]]; then
    rm -rf bundle/neobundle.vim
fi

echo "Installing Package Manager..."
git clone -q git://github.com/smancill/neobundle.vim.git bundle/neobundle.vim

if [[ $? -eq 0 ]]; then
    echo "Package Manager installed sucessfully"
    echo "See https://github.com/smancill/neobundle.vim#readme"
else
    echo "Could not install package manager"
    exit
fi

# Create symbolic links
ln -sf "${VIMDIR}"/vimrc  "${VIMRC}"
ln -sf "${VIMDIR}"/gvimrc "${GVIMRC}"

# Install plugins
echo "\nInstalling plugins..."
sleep 2
vim +NeoBundleInstall! +qa!
echo "Done!"
