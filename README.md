# What About Kawaii-Term
kawaii-termは主にエンジニアに対して適切に精神的な癒しを与えることで、ストレスを低減するものです.  
この世界が可愛ければ戦争は無くなるのに  

## 機能一覧
- 任意の文字列の表示
- 空きメモリの表示
- $の書き換え
- CPU使用率
- Diskの使用状況
- 天気の表示
- 一部のコマンドのオーバーライド[1] 
- ビッグデータ用のコマンド[2]

## サポートしているOS
- Ubuntu Linux (zesty, x86_64, armhf, arm64)
- Debian Linux (sid, armhf, arm64)
- Arch Linux (x86_64)

## Requrements
python3が以下のパスに通っている必要があります  
```console
$ which python3
/usr/bin/python3
```

Ubuntu Linux, Debian Linuxでは以下のようにインストールしてください
```console
$ sudo apt install python3
```

curlもインストールされている必要があります
```console
$ which curl
/usr/bin/curl
```

Ubuntu Linux, Debian Linuxでは以下のようにインストールしてください
```console
$ sudo apt install curl
```

## Install 
HOMEディレクトリにこのプロジェクトをgit cloneで配置する必要があります
```console
$ git clone https://github.com/GINK03/kawaii-term
```
template.bashrcを~/.bashrcに追加します（アップデート時は計算時間が無駄にならないように適切に、軽くしてください）
```
$ cd kawaii-term
$ cat templte.bashrc  >> ~/.bashrc
```

## 画面イメージ
<p align="center">
  <img width="600px" src="https://user-images.githubusercontent.com/4949982/29257316-e892855e-80eb-11e7-808f-cf755b147aba.png">
</p>
<div align="center"> 図1. ログイン時にスプラッシュでアスキーアートが流れます </div>
