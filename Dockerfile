# ベースイメージの指定
# latestはバージョンが変わる可能性があるので、バージョンを指定する！
FROM node:18.16.0-alpine3.17

# コンテナ内で作業する際のカレントディレクトリの指定
WORKDIR /app

# 依存関係のインストール
# RUN yarn install