# load docker group
group=docker
if [ $(id -gn) != $group ]; then
  newgrp docker
  exit 0
fi

# load ssh keys
eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/id_auth 2> /dev/null
ssh-add ~/.ssh/id_sign 2> /dev/null

# load zsh
export SHELL=zsh
$SHELL
