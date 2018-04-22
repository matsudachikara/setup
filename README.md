#### 環境構築用スクリプト等の諸々保管場所です

* とにかくVMでamazonlinuxの開発環境を作りたいとき
   ```
   git clone git@github.com:matsudachikara/setup.git
   mv setup #{任意のフォルダ名}
   cd #{任意のフォルダ名}
   vi Vagrantfile # お好みで設定を変える
   vagrant up
   vi Vagrantfile # 初回起動の設定などのコメントアウト＆コメント解除
   vagrant ssh

   ```
* 今の状態でpackage.boxを作成
    ```
    vagrant package
    vagrant box add #{box名} package.box

    ```
    ~/.vagrant.d/boxes/に保存されます

* プロビジョンを手動で一部だけ実行
    ```
    id_rsa.pubをコピー
    vagrant provision --provision-with file
    ```
    ```
    任意のユーザーを作成
    vagrant provision --provision-with setup_user
    ```
    ```
    vagrantユーザーを削除
    vagrant provision --provision-with delete_vagrant_user
    ```


* その他シェルなどが適当に置いてあります