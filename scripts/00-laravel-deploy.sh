#!/usr/bin/env bash

echo "Installing composer and dependencies…"
/usr/bin/composer install --no-dev --optimize-autoloader

echo "Generating app key…"
php artisan key:generate --force

echo "Caching config and routes…"
php artisan config:cache
php artisan route:cache


if [ ! -f /app/.seeded ]; then
  php artisan migrate --force
  php artisan db:seed --force
  touch /app/.seeded
fi
exec "$@"


composer dump-autoload

echo "Starting Laravel server…"
php artisan serve --host=0.0.0.0 --port=8000
