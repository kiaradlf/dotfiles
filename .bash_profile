# load ssh keys
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_auth
ssh-add ~/.ssh/id_sign

# load docker group
newgrp docker

# load packages
export SHELL=fish
nix-shell -p helix gh nushell zoxide lazygit fish zsh ripgrep fd just any-nix-shell bat docker-compose poetry \
  --command 'fish -f fish_vi_key_bindings'

# # use nushell
# export SHELL=nu
# $SHELL
# set -o vi
