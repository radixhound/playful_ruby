#!/bin/bash
SCRIPT_DIR=$( dirname -- "$( readlink -f -- "$0"; )"; )

echo pwd
echo "mkdir $1"
mkdir $1
echo "cp $SCRIPT_DIR/* $1/"
cp $SCRIPT_DIR/* $1/
echo "cd $1"
cd $1

echo "sed -i '' 's/myapp/$1/' Dockerfile"
sed -i '' "s/myapp/$1/" Dockerfile

# https://stackoverflow.com/questions/26081375/bsd-sed-extra-characters-at-the-end-of-d-command
echo "sed -i '' 's/myapp/$1/' docker-compose.yml"
sed -i '' "s/myapp/$1/" docker-compose.yml
cat docker-compose.yml

docker compose up db --detach

echo "docker compose run --no-deps $1 rails new . --force --database=postgresql"
docker compose run --no-deps $1 rails new . --force --database=postgresql --css=tailwind
docker compose build

echo "sed -i '' 's/adapter: postgresql/adapter: postgresql\n  encoding: unicode\n  host: db\n  username: postgres\n  password: password/' config/database.yml"
sed -i '' 's/adapter: postgresql/adapter: postgresql\n  encoding: unicode\n  host: db\n  username: postgres\n  password: password/' config/database.yml

docker compose run --no-deps $1 rails db:create
docker compose up $1 --detach
