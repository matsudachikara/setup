#### 環境構築用スクリプト等の諸々保管場所です

* とにかくVMでamazonlinuxの開発環境を作りたいとき
   ```
   mkdir #{VMのvagrantfile置く場所}
   cd #{VMのvagrantfile置く場所}
   git@github.com:matsudachikara/setup.git
   
   ```
* 今の状態でpackage.boxを作成
    ```
    vagrant package
    vagrant box add #{box名} package.box

    ```
    ~/.vagrant.d/boxes/に保存されます

* プロビジョンを手動で一部だけ実行

vagrant provision --provision-with #{実行したいプロビジョナー}
vagrant provision --provision-with file

* その他シェルなどが適当に置いてあります