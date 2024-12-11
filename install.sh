#!bin/bash

# Updating & Installing Dependencies
apt-get update
apt-get install -y git curl vim wget redis-server systemctl
apt-get clean

# Installing NVM
if ! command -v nvm &> /dev/null
then
    echo 'Installing nvm...'
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    echo 'nvm Installed'
else
    echo 'nvm is alrea:dy installed'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Installing Node.js
if ! command -v node &> /dev/null
then
    echo 'Installing Node.js...'
    nvm install 20.18.1
    nvm use 20.18.1
    node -v
else
    echo 'Node.js is already installed'
fi

# Enabling typescript globally
npm install -g typescript

if [ ! -d "data/talawa-api" ]; then
    cd data
    git clone https://github.com/PalisadoesFoundation/talawa-api
    cd talawa-api
    git checkout develop
else
    cd data/talawa-api
fi

echo "DOCKER SETUP COMPLETED !!!"
