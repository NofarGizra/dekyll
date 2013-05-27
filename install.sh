#!/bin/bash

chmod 777 www/sites/default/
bash scripts/build

cd www

mkdir sites/default/files
chmod -R 777 sites/default/files

# Get composer
curl -sS https://getcomposer.org/installer | php
php composer.phar install --working-dir="./libraries"

drush si -y dekyll --account-pass=admin --db-url=mysql://root:root@localhost/dekyll
drush vset dekyll_git_repository 'git@github.com:amitaibu/jekyll-bootstrap.git'
