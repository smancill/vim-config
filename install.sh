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

# Check ~/.vim directory
DIR="$(dirname "$0")"
cd "$DIR"
DIR="$(pwd)"
if [ "$DIR" != "$HOME/.vim" ]; then
    echo "Clone the repository in $HOME/.vim, not in $DIR"
    exit 1
fi

# Create directory for bundles
if [ $FORCE = true ]; then
    rm -rf ${VIMDIR}/bundle
fi
mkdir -p ${VIMDIR}/bundle
mkdir -p ${VIMDIR}/autoload

# Create directory for swap/backup/undo files
mkdir -p ${CACHEDIR}

# Install package manager
echo -e "Installing vim-plug package manager..."
sleep 1
curl -fLo ${VIMDIR}/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [[ $? -eq 0 ]]; then
    echo -e "\nPackage manager installed sucessfully"
    echo -e "https://github.com/junegunn/vim-plug#readme"
else
    echo -e "\nCould not install package manager"
    exit
fi

# Create symbolic links
ln -sf ${VIMDIR}/vimrc  ${VIMRC}
ln -sf ${VIMDIR}/gvimrc ${GVIMRC}

# Install plugins
if [ $SKIP = false ]; then
    log_file=$(mktemp 2>/dev/null || mktemp -t 'tmp')
    trap "rm -f $log_file" EXIT
    echo -e "\nInstalling plugins..."
    sleep 1
    vim -N -u ${VIMRC} -U NONE -i NONE \
        -c "try | PlugInstall | finally | w $log_file | qall! | endtry" \
        -e
    cat $log_file
    if grep -q '^x ' $log_file; then
        echo -e "\nCould not install all plugins. Check log."
    fi
    echo
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
