# one-time setup

# install Nix: https://nix.dev/install-nix
curl -L https://nixos.org/nix/install | sh -s -- --daemon

# add existing ssh keys
chmod 0600 ~/.ssh/*
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_auth
ssh-add ~/.ssh/id_sign

# initialize zoxide
nix-shell -p zoxide --command 'zoxide init fish | source'
