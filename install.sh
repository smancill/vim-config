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
git submodule init && git submodule update
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

# Create directory for swap/backup/undo files
mkdir -p ${HOME}/.cache/vim/{swap,backup,undo}

# Spell files
echo -e "\nGetting spell files..."
sleep 1
mkdir -p ${VIMDIR}/spell
cd spell
for idiom in es en; do
    for enc in latin1 utf-8; do
        for ver in spl sug; do
            rm -f ${VIMDIR}/spell/${idiom}.${enc}.${ver}
            wget -O${VIMDIR}/spell/${idiom}.${enc}.${ver} \
                    http://ftp.vim.org/vim/runtime/spell/${idiom}.${enc}.${ver}
        done
    done
done

echo -e "\nDone!"
