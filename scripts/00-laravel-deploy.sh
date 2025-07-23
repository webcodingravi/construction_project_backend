#!/usr/bin/env bash

echo "Installing composer and dependencies…"
/usr/bin/composer install --no-dev --optimize-autoloader

echo "Generating app key…"
php artisan key:generate --force

echo "Caching config and routes…"
php artisan config:cache
php artisan route:cache

echo "Running migrations…"
php artisan migrate --force

echo "Running Seeding…"
php artisan db:seed --force

echo "Starting Laravel server…"
php artisan serve --host=0.0.0.0 --port=8000
