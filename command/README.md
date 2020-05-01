# 外部コマンドを Ruby から実行する方法調査

## 利用したライブラリ

systemu

## 実装中に出くわしたこと

### open3 を利用した場合に、外部コマンドからの出力文字列を split するところでエラーが発生

```
ArgumentError:
  invalid byte sequence in UTF-8
```

**解決策**  

* 外部コマンドを実行するライブラリを systemu に変更
* 外部コマンドからの出力を SJIS に変換する処理を追加
* 出力確認に p ではなく puts を利用するよう変更

