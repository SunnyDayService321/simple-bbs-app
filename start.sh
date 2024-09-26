#!/bin/bash

# データベースファイルが存在しない場合は作成
if [ ! -f /var/www/database/database.sqlite ]; then
    touch /var/www/database/database.sqlite
    chmod 666 /var/www/database/database.sqlite
fi

# マイグレーションの実行
php artisan migrate --force
# Laravelサーバーの起動
php artisan serve --host=0.0.0.0 --port=8000
