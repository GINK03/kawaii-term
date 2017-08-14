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
template.bashrcを~/.bashrcに追加します（アップデート時は計算時間が無駄にならないように適切に、重複等を消すなどして、軽くしてください）
```
$ cd kawaii-term
$ cat templte.bashrc  >> ~/.bashrc
```

## 画面イメージ
<p align="center">
  <img width="600px" src="https://user-images.githubusercontent.com/4949982/29257316-e892855e-80eb-11e7-808f-cf755b147aba.png">
</p>
<div align="center"> 図1. ログイン時にスプラッシュでアスキーアートが流れます </div>

template.bashrcのPS1というところを編集することで、ターミナルのテキストや詳細は変更できますが、デフォルトではこのような感じです
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
<p align="center">
  <img width="100%" src="https://user-images.githubusercontent.com/4949982/29261225-7343450e-8109-11e7-9a45-9363fa536971.png">
</p>
<div align="center">図3. clearを押すと、比較的大きなAAが表示され、結果としてカーソルが下の方にくる</div>

### explosion(ex)
ビッグデータなどを扱い、大きなデータセットを消そうとすると、rmコマンドでは消せません  
そこでexplosionという長めのコマンドで、警告なしで、OSがファイルとして認識できるのであれば、問題なく消せるコマンドを新たに追加します  
(無警告なので、注意してください)  
```console
$ explosion target/*
```
めぐみんというキャラクタのAAをみることができます
<p align="center">
  <img width="100%" src="https://user-images.githubusercontent.com/4949982/29261528-f37e936c-810a-11e7-8a6c-da1033d001b9.png">
</p>
<div align="center">図4. めぐみん</div>  

## terminal中の天気に関して
[openweathermap.org](https://openweathermap.org/)の無料プランを用いています  
サンプルに私のAPIキーがバンドルされていますが、無料で利用できるので、適切にご自身のAPIキーに書き換えてください（私がバンされてしまいます）  
kawaii-term/weather.pyを編集して、中のAPIキーを変えてください  
また、お住いの都市にURLを書き換えて、予想する都市部を便利な箇所に変えてご利用ください  

これを、
```python
  raw = os.popen('curl -s "http://api.openweathermap.org/data/2.5/weather?q=Tokoy,jp&appid=1e240e732347c23472274dc188cd39d6"').read()
```
このようにします
```python
  raw = os.popen('curl -s "http://api.openweathermap.org/data/2.5/weather?q=${YOUR_CITY}&appid=${YOUT_API}"').read()
```

## 左のプロンプトと右のプロンプトの幅について
自動で幅を計算してたのですが、tmux経由で使用すると微妙にずれるので、ハードコードしました　　

お使いのディスプレイによっては適切に表示されないかもしれません　　

template.bashrcの$YOUR_WIDTHを任意の値にしてみてください　　
```bash
RIGHT_PRONPT() {
  # パディング幅を%*s ${COLUMNS}で指定できるが、tmux経由だと、よく破綻しているので、ハードコードでもいいかもしれない
  printf "%*s" {{$YOUR_WIDTH}} "$(tput setaf 199)$(tput bold)$(CPU_USAGE)$(tput sgr0) $(tput setaf 2)$(DISK_USAGE) $(tput setaf 123)[TENKI:$(GET_WEATHER)]$(tput sgr0)"
}
```
## ライセンス
WTFPL (Do What The Fuck You Want To Public License)
