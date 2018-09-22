#!/bin/bash

set -u

# Paths
vimdir=${HOME}/.vim
vimrc=${vimdir}/vimrc
cachedir=$HOME/.cache/vim

# Get user option
force=false
dirs_only=false
skip=false
if [ $# -eq 1 ]; then
    case "$1" in
        -f) force=true ;;
        -d) dirs_only=true ;;
        -s) skip=true ;;
        *) echo "Unknown option."; exit 2 ;;
    esac
fi

# Check ~/.vim directory
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ "${script_dir}" != "${vimdir}" ]; then
    echo "Clone the repository in ${vimdir}, not in ${script_dir}"
    exit 1
fi

# Create directory for bundles
if [ ${force} = true ]; then
    rm -rf "${vimdir}/bundle"
fi
mkdir -p "${vimdir}/bundle"
mkdir -p "${vimdir}/autoload"

# Create directory for swap/backup/undo files
mkdir -p "${cachedir}"/{swap,backup,undo}
if [ ${dirs_only} = true ]; then
    exit
fi

# Install package manager
vimplug_url=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vimplug_vim=${vimdir}/autoload/plug.vim
echo -e "Installing vim-plug package manager..."
if [ ! -f "${vimplug_vim}" ]; then
    sleep 1
    if curl -fLo "${vimplug_vim}" --create-dirs ${vimplug_url}; then
        echo -e "\nPackage manager installed sucessfully"
        echo -e "https://github.com/junegunn/vim-plug#readme"
    else
        echo -e "\nCould not install package manager"
        exit
    fi
else
    echo -e "Package manager already installed"
fi

# Install plugins
if [ ${skip} = false ]; then
    log_file=$(mktemp 2>/dev/null || mktemp -t 'tmp')
    trap 'rm -f "$log_file"' EXIT
    echo -e "\nInstalling plugins..."
    sleep 1
    vim -N -u "${vimrc}" -U NONE -i NONE \
        -c "try | PlugInstall | finally | w ${log_file} | qall! | endtry" \
        -e
    cat "${log_file}"
    if grep -q '^x ' "${log_file}"; then
        echo -e "\nCould not install all plugins. Check log."
    fi
    echo
fi

# Spell files
echo -e "\nGetting spell files..."
sleep 1
spell_url=http://ftp.vim.org/vim/runtime/spell
spell_dir=${vimdir}/spell
if [ ${force} = true ]; then
    rm -rf "${spell_dir}"
fi
mkdir -p "${spell_dir}"
for idiom in es en; do
    for enc in latin1 utf-8; do
        for ver in spl sug; do
            spell_name=${idiom}.${enc}.${ver}
            spell_file=${spell_dir}/${spell_name}
            if [ ! -f "${spell_file}" ]; then
                wget -O"${spell_file}" "${spell_url}/${spell_name}"
            fi
        done
    done
done

echo -e "\nDone!"
