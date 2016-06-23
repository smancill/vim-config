#!/bin/bash

set -u

# Paths
vimdir=${HOME}/.vim
vimrc=${HOME}/.vimrc
gvimrc=${HOME}/.gvimrc
cachedir=$HOME/.cache/vim

# Get user option
force=false
skip=false
if [ $# -eq 1 ]; then
    if [ "$1" = "-f" ]; then
        force=true
    fi
    if [ "$1" = "-s" ]; then
        skip=true
    fi
fi

# Check ~/.vim directory
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
if [ "${script_dir}" != "${vimdir}" ]; then
    echo "Clone the repository in ${vimdir}, not in ${script_dir}"
    exit 1
fi

# Create symbolic links
ln -sf "${vimdir}/vimrc"  "${vimrc}"
ln -sf "${vimdir}/gvimrc" "${gvimrc}"

# Create directory for bundles
if [ ${force} = true ]; then
    rm -rf "${vimdir}/bundle"
fi
mkdir -p "${vimdir}/bundle"
mkdir -p "${vimdir}/autoload"

# Create directory for swap/backup/undo files
mkdir -p "${cachedir}"

# Install package manager
echo -e "Installing vim-plug package manager..."
sleep 1
curl -fLo "${vimdir}/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [[ $? -eq 0 ]]; then
    echo -e "\nPackage manager installed sucessfully"
    echo -e "https://github.com/junegunn/vim-plug#readme"
else
    echo -e "\nCould not install package manager"
    exit
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
