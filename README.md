# Ruby

[ビジネスロジックに依存しない、基本的な機能の使い方を調査するためのリポジトリ](https://github.com/cmpk/java)をRubyで実装してみた

## 動作確認環境、前提条件

* Windows 10
* Ruby version 2.7.1
* ソースファイルは UTF-8, 改行コードは LF

## 一覧

| ディレクトリ | 内容                          | 主要外部ライブラリ |
| ------------ | ----------------------------- | ------------------ |
| command      | 外部コマンド実行              | systemu            |
| csv          | CSV読込、書込、バリデーション | activerecord       |

* 外部ライブラリは gem コマンドでインストール
