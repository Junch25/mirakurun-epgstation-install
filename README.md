# mirakurun-epgstation-install
MirakurunとEPGStationを自動的にインストールできるスクリプト

## Usage / 使用方法
ライブラリインストールとソースダウンロード
```(bash)
$ sudo apt-get install cmake g++ git curl samba unzip gcc make
$ git clone https://github.com/Junch25/mirakurun-epgstation-install.git
$ cd shell/
```

Mirakurunを自動でインストールと設定スクリプト
```(bash)
$ bash mirakurun-install.sh
```
Mirakurunを自動設定スクリプト
```(bash)
$ bash mirakurun-config.sh
```
EPGStationを自動でインストールと設定スクリプト
```(bash)
$ bash epgstion-install.sh
```
MirakurunとEPGStationの両方を自動でインストールと設定スクリプト
```(bash)
$ bash mirakurun_epgstion.sh
```

## スクリプトについて
以下2つのプログラムを自動インストールできるShellScriptを作りました。
| Name | URL |
| ---- | ---- |
| Mirakurun | https://github.com/Chinachu/Mirakurun |
| EPGStation | https://github.com/l3tnun/EPGStation |

## 動作について
Ubuntu server 20.04にて動作確認済となります。

自分の環境用に合わせていますので、適宜変更お願いします。
