# やりたいこと
- ディレクトリ配下ファイルに特殊スペース(0xa0 = NBSP = Macで`Opt`+スペースで入力される)が入っている場合、commitがキャンセルされるようにする
 
# 前提条件
```shell
# ディレクトリ作成
[ ! -e ~/.config/git/hooks ] && mkdir -p ~/.config/git/hooks

# globalで
git config --global core.hooksPath '~/.config/git/hooks'

# テンプレをコピー
cp -p $(brew --prefix git)/share/git-core/templates/hooks/pre-commit.sample ~/.config/git/hooks/pre-commit

# commit時に実行したいスクリプトを作成(pre-commitから呼び出す)
vi _run_local-hook.sh

# テンプレファイルとスクリプトの内容はファイルを参照
```

## 注意
Linkにある通り、リポジトリ単位でhookを使いたい場合は留意すること

# 使い方
1. 前提条件を満たす
1. git commitする

# Links
- [Qiita - globalなgit-hooksを設定して、すべてのリポジトリで共有のhooksを使う](https://qiita.com/ik-fib/items/55edad2e5f5f06b3ddd1)
