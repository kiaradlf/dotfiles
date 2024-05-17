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
# make group
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# install vscode: https://code.visualstudio.com/blogs/2020/12/03/chromebook-get-started
sudo apt-get update
sudo apt-get install -y gnome-keyring direnv
# manually open vscode .deb

# install python
sudo apt-get install -y python3-pip python3-dev python3-venv build-essential libssl-dev libffi-dev
sudo apt-get install -y pkg-config

# make poetry put its files in a place accessible by chromeos
nix-shell -p poetry --command poetry config virtualenvs.in-project true

# initialize zoxide
nix-shell -p zoxide --command 'zoxide init fish | source'

# add ssh keys from gist
mkdir -p ~/.ssh
cp /mnt/chromeos/MyFiles/Downloads/ssh/* ~/.ssh/
chmod 0600 ~/.ssh/*

# source .bash_profile so i can add to that instead
echo ". $HOME/.bash_profile" >> ~/.bashrc

# install basic command-line utilities
nix-env -i helix gh lazygit ripgrep fd any-nix-shell bat nushell fish zsh zoxide poetry tealdeer jaq yq

# set git identity
git config --global user.email "kiara@datalab.nl"
git config --global user.name "Kiara Grouwstra"
git config --global push.autoSetupRemote true
