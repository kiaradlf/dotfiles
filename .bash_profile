# load ssh keys
eval "$(ssh-agent -s)"
# load packages
export SHELL=fish
nix-shell -p helix gh nushell zoxide lazygit fish zsh ripgrep fd just any-nix-shell bat \
  --command 'fish -f fish_vi_key_bindings'

# # use nushell
# export SHELL=nu
# $SHELL
# set -o vi
