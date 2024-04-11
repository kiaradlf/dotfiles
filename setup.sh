# one-time setup

# install Nix: https://nix.dev/install-nix
curl -L https://nixos.org/nix/install | sh -s -- --daemon

# install docker: https://docs.docker.com/engine/install/debian/
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# initialize zoxide
nix-shell -p zoxide --command 'zoxide init fish | source'

# add ssh keys from gist
mkdir -p ~/.ssh
cp /mnt/chromeos/MyFiles/Downloads/ssh/* ~/.ssh/
chmod 0600 ~/.ssh/*
