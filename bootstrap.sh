#!/bin/bash

set -e

if [ -f composer.json ]
then
    echo -e "\e[1;33mRunning composer install. \e[m"
    composer install
else
    echo -e "\e[1;32mDone.\e[m"
fi

if [ -f package.json ]
then
    echo -e "\e[1;33mRunning npm install. \e[m"
    npm install
else
    echo -e "\e[1;32mDone.\e[m"
fi

if [ -f .env.example ] && [ ! -f .env ]
then
	echo -e "\e[1;33mCreating env file.\e[m"
    cp .env.example .env
else
    echo -e "\e[1;32mDone.\e[m"
fi

if [ -f artisan ]
then
	echo -e "\e[1;33mGenerating application key.\e[m"
    php artisan key:generate
else
	echo -e "\e[1;32mDone.\e[m"
fi