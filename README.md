dotfiles
====

私の使っている設定ファイルたちです。

動作環境
----

* Ubuntu 13.04


設定しているアプリケーション
----

* byobu-tmux
* git
* tig
* vim
* zsh


使い方
----

```sh
$ git clone git://github.com:itiut/dotfiles.git
$ ./dotfiles/create_symlink.sh
```

設定方針
----

### Zsh
`.zshrc` が設定ファイルで、`.zsh.d/` にその他諸々を入れています。  
Antigenを使ってプラグインの管理をしていて、Antigenで管理できないものとAntigen自体は `.zsh.d/` に `git submodule` して管理しています。

また、`.zsh_history` も `.zsh.d/` に保存してあります。  
Dropboxを使って、Dropboxディレクトリ中からホームディレクトリにシンボリックリンクを作ることで、複数環境でヒストリを共有しています。

### Vim
メインのエディタはEmacsですが、ターミナル上ですぐ終わるファイルの編集などにはVimを使っています。  
設定としては、表示の変更と、`C-g` を `ESC` にマッピングしてるくらいです。  
極力デフォルトの挙動を崩さないようにしていて、プラグインも入れていません。

### byobu
ターミナルエミュレータのbyobuをローカルで使っています。  
リモートのscreenやtmuxとエスケープシーケンスが被らないように、`C-q` に設定しています。
