#!/bin/bash

VIMDIR=${HOME}/.vim
VIMRC=${HOME}/.vimrc
GVIMRC=${HOME}/.gvimrc

# Create directory for bundles
mkdir -p ${VIMDIR}/bundle

# Install package manager
if [[ -d ${VIMDIR}/bundle/neobundle.vim ]]; then
    rm -rf ${VIMDIR}/bundle/neobundle.vim
fi

echo -e "Installing Package Manager..."
git clone git://github.com/smancill/neobundle.vim.git \
        ${VIMDIR}/bundle/neobundle.vim

if [[ $? -eq 0 ]]; then
    echo -e "\nPackage Manager installed sucessfully"
    echo -e "See https://github.com/smancill/neobundle.vim#readme"
else
    echo -e "\nCould not install package manager"
    exit
fi

# Create symbolic links
ln -sf ${VIMDIR}/vimrc  ${VIMRC}
ln -sf ${VIMDIR}/gvimrc ${GVIMRC}

# Install plugins
echo -e "\nInstalling plugins..."
sleep 2
vim +NeoBundleInstall! +qa!
echo -e "\nDone!"
