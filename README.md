My Emacs settings
====

私が使っているEmacsの設定です。

動作環境
----

* Ubuntu 13.04
* Emacs 24

インストール
----

```sh
$ sudo add-apt-repository ppa:cassou/emacs
$ sudo apt-get update
$ sudo apt-get install emacs24
$ git clone git@github.com:itiut/emacs.d.git ~/.emacs.d
```

ファイル構成
----

```sh
$ tree ~/.emacs.d -F -L 1
/home/itiut/.emacs.d
├── config/
├── el-get/
├── etc/
├── init.el
├── init.elc
└── README.md

3 directories, 3 files
```

* `init.el`  
    全般的な設定と、el-getでインストールするパッケージの管理をしています。  
    また、`config/` にある個別のパッケージの設定ファイルを読み込みます。  
    `init.el` を含め、読み込む全てのelispをバイトコンパイルしています。

* `config/`  
    個別のパッケージの設定を入れておくディレクトリです。  
    パッケージのロード `(require 'hogehoge)` などと、その後の設定をひとまとまりとして、各ファイルに分けて管理しています。  
    ファイル名は、`config-hogehoge.el` のように命名しています。

* `el-get/`  
    el-getのパッケージインストール先ディレクトリです。  

* `etc/`  
    elisp以外の設定ファイルなどを入れておくディレクトリです。

    * `etc/recipes/`  
        el-getのユーザーレシピ
    * `etc/snippets/`  
        yasnippetのユーザースニペット

    などです。
