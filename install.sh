#!/bin/bash

# Paths
VIMDIR=${HOME}/.vim
VIMRC=${HOME}/.vimrc
GVIMRC=${HOME}/.gvimrc
CACHEDIR=$HOME/.cache/vim

# Get user option
FORCE=false
SKIP=false
if [ $# -eq 1 ]; then
    if [ "$1" = "-f" ]; then
        FORCE=true
    fi
    if [ "$1" = "-s" ]; then
        SKIP=true
    fi
fi

# Create directory for bundles
if [ $FORCE = true ]; then
    rm -rf ${VIMDIR}/bundle
fi
mkdir -p ${VIMDIR}/bundle

# Create directory for swap/backup/undo files
mkdir -p ${CACHEDIR}

# Install package manager
if [[ -d ${VIMDIR}/bundle/neobundle.vim ]]; then
    rm -rf ${VIMDIR}/bundle/neobundle.vim
fi

echo -e "Installing Package Manager..."
git submodule update --init
if [[ $? -eq 0 ]]; then
    echo -e "\nPackage Manager installed sucessfully"
    echo -e "See https://github.com/Shougo/neobundle.vim#readme"
else
    echo -e "\nCould not install package manager"
    exit
fi

# Create symbolic links
ln -sf ${VIMDIR}/vimrc  ${VIMRC}
ln -sf ${VIMDIR}/gvimrc ${GVIMRC}

# Install plugins
if [ $SKIP = false ]; then
    echo -e "\nInstalling plugins..."
    sleep 2
    vim +NeoBundleInstall! +qa!
fi

# Spell files
echo -e "\nGetting spell files..."
sleep 1
SPLURL=http://ftp.vim.org/vim/runtime/spell
SPLDIR=${VIMDIR}/spell
if [ $FORCE = true ]; then
    rm -rf ${SPLDIR}
fi
mkdir -p ${SPLDIR}
for idiom in es en; do
    for enc in latin1 utf-8; do
        for ver in spl sug; do
            SPLNAME=${idiom}.${enc}.${ver}
            SPLFILE=${SPLDIR}/${SPLNAME}
            if [ ! -f $SPLFILE ]; then
                wget -O${SPLFILE} ${SPLURL}/${SPLNAME}
            fi
        done
    done
done

echo -e "\nDone!"
