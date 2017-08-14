# What About Kawaii-Term
kawaii-termは主にエンジニアに対して適切に精神的な癒しを与えることで、ストレスを低減するものです　　

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

template.bashrcのPS１というところを編集することで、ターミナルのテキストや詳細は変更できますが、デフォルトではこのような感じです
<p align="center">
  <img width="100%" src="https://user-images.githubusercontent.com/4949982/29258004-3d5d9196-80f1-11e7-9544-ce940548b359.png">
</p>
<div align="center"> 図2. 項目の入れ替えはPS1を編集することで行えます  </div>

## 標準コマンドのオーバーライド
いくつかのコマンドにて、機能を上書きしたり、追加したりして任意の動作をさせています  
- ls (l -CFにエイリアスされています)
- clear
- explosion

### ls
lだけで入力できるようにしています
```console
$ l
はわわ〜〜〜！💦
22/  cuda/  go/  keras-skip-though-vector/  metas/  td2.pem   テンプレート/  ビデオ/  公開/
NVIDIA_CUDA-8.0_Samples/  cudnn-8.0-linux-x64-v5.1.tgz  go1.8.3.linux-amd64.tar.gz  keras-unstructured-data  minimize.zip  v/
aws/  examples.desktop  kawaii-term/  kotlin-headlessbrowser-selenium-jsoup-parser/  sdb/
```

### clear
clearはバッファがおかしくなった時にリセットをしますが、上の方にカーソルが行ってしまい、視線を動かす必要があるので、アスキーアートを前方に投入することで、カーソルの場所の調整を行います  
```console
$ clear
```

