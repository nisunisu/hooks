# やりたいこと
- gitディレクトリ配下のテキストファイルに特殊スペース(0xa0 = NBSP = Macで`Opt`+スペースで入力される)が入っている場合、commitがキャンセルされるようにする
 
# 前提条件
```shell
# ディレクトリ作成
[ ! -e ~/.config/git/hooks ] && mkdir -p ~/.config/git/hooks

# globalでhookのpathを設定
git config --global core.hooksPath '~/.config/git/hooks'

# (本リポジトリ以外のファイルを作成したい場合)hook path配下にテンプレファイルを持ってくる
cp -p $(brew --prefix git)/share/git-core/templates/hooks/pre-commit.sample ~/.config/git/hooks/pre-commit

# commit時に実行したいスクリプトを作成(pre-commitから呼び出す)
vi _run_local-hook.sh

# テンプレファイルとスクリプトの内容はファイルを参照
```

## 注意
Linkにある通り、リポジトリ単位でhookを使いたい場合は留意すること

# 使い方
1. 前提条件を満たす or 以下を実施
    ```shell
    mkdir -p ~/.config/git
    [ -d hooks ] && mv hooks hooks_$(date +"%Y%m%d") # 既にhooksディレクトリがある場合はフォルダごと退避する
    git clone ${this_git_repogitory}
    ```
1. 任意の作業スペースで`git commit`する

# Links
- [Qiita - globalなgit-hooksを設定して、すべてのリポジトリで共有のhooksを使う](https://qiita.com/ik-fib/items/55edad2e5f5f06b3ddd1)
