#!/bin/sh

# Check ~/.vim directory
DIR="$(dirname "$0")"
cd "$DIR/.."
DIR="$(pwd)"
if [ "$DIR" != "$HOME/.vim" ]; then
    echo "Clone the repository in ~/.vim, not in $DIR"
    exit 1
fi

# Check Ansible
if ! type ansible-playbook > /dev/null; then
    echo "Ansible is required: 'sudo pip install ansible'"
    exit 1
fi

# Ansible needs a hosts file
cat << EOF > .hosts
[local]
127.0.0.1
EOF
trap "rm -f .hosts" EXIT

# Run the playbook
ansible-playbook -i .hosts -c local -M share/scripts share/setup.yml
