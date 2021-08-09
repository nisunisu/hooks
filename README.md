# やりたいこと
- gitディレクトリ配下のテキストファイルに特殊スペース(0xa0 = NBSP = Macで`Opt`+スペースで入力される)が入っている場合、commitがキャンセルされるようにする
 
# 使い方
1. ファイルを用意
    ```shell
    mkdir -p ~/.config/git
    
    cd ~/.config/git
    
    [ -d hooks ] && mv hooks hooks_$(date +"%Y%m%d") # 既にhooksディレクトリがある場合はフォルダごと退避する
    
    git clone ${this_git_repogitory}
    ```
1. globalでhookのpathを設定
    ```shell
    git config --global core.hooksPath '~/.config/git/hooks'
    git config --global --list
    ```
1. 任意の作業スペースで`git commit`する

# Links
- [Qiita - globalなgit-hooksを設定して、すべてのリポジトリで共有のhooksを使う](https://qiita.com/ik-fib/items/55edad2e5f5f06b3ddd1)

## 注意
Linkにある通り、リポジトリ単位でhookを使いたい場合は留意すること
