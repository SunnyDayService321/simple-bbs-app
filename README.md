# Simple BBS App

PHP / Laravel で構築したシンプルな掲示板（BBS）アプリです。
Docker環境で動作し、`docker-compose up` 一発で自動起動できます。

## 🛠 技術スタック

- **言語**: PHP
- **フレームワーク**: Laravel
- **データベース**: SQLite
- **フロントエンド**: Blade、Vite
- **インフラ**: Docker、Docker Compose

## 📁 ディレクトリ構成

```
simple-bbs-app/
├── app/              # モデル・コントローラー・ミドルウェア
├── bootstrap/        # アプリケーション起動設定
├── config/           # 各種設定ファイル
├── database/         # マイグレーション・SQLiteファイル
├── public/           # 公開ディレクトリ
├── resources/        # Bladeテンプレート・CSS・JS
├── routes/           # ルーティング定義
├── storage/          # ログ・キャッシュ
├── tests/            # テストコード
├── Dockerfile
├── docker-compose.yml
├── start.sh          # 自動起動スクリプト
└── README.md
```

## 🚀 セットアップ手順

### 1. リポジトリをクローン

```bash
git clone https://github.com/SunnyDayService321/simple-bbs-app.git
cd simple-bbs-app
```

### 2. 環境変数ファイルを作成

```bash
cp .env.example .env
```

### 3. Dockerコンテナを起動

```bash
docker-compose up -d --build
```

以下が自動で実行されます。
- SQLiteデータベースファイルの作成
- マイグレーションの実行
- Laravelサーバーの起動

ブラウザで http://localhost:8000 にアクセスしてください。

## 🧪 テストの実行

```bash
docker-compose exec app php artisan test
```

## 📋 主な機能

- 投稿の一覧表示
- 投稿の作成
- 投稿の編集
- 投稿の削除
