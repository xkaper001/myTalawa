#!bin/bash

if ! command -v nvm &> /dev/null
then
    echo 'Installing nvm...'
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    echo 'nvm Installed'
else
    echo 'nvm is already installed'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if ! command -v node &> /dev/null
then
    echo 'Installing Node.js...'
    nvm install --lts
    nvm use --lts
    node -v
else
    echo 'Node.js is already installed'
fi

npm install -g typescript


if [ ! -d "data/talawa-api" ]; then
    cd data
    git clone https://github.com/PalisadoesFoundation/talawa-api
    cd talawa-api
else
    cd data/talawa-api
fi

service redis-server start # port 6379  

echo "DOCKER SETUP COMPLETED !!!"