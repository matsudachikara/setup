環境構築用スクリプト等の諸々保管場所です

* 今の状態でpackage.boxを作成

vagrant package
vagrant box add #{box名} package.box
~/.vagrant.d/boxes/に保存されます

* プロビジョンを手動で一部だけ実行

id_rsa.pubをコピー
vagrant provision --provision-with file


任意のユーザーを作成
vagrant provision --provision-with setup_user

vagrantユーザーを削除
vagrant provision --provision-with delete_vagrant_user
