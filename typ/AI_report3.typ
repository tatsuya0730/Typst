#import "../format/report_format.typ": *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/codelst:2.0.0": sourcecode
// #import "@preview/physica:0.9.2"

#show: master_thesis.with(
  title: "計算機システムとAI基礎",
  subtitle: "レポート3",
  author: "Tatsuya Kawaguchi",
  id: "2510414",
  university: "JAIST",
//   bibliography-file: "../bib/PR_0604.bib",
)

= 変更意図

訓練データが60000なので、バッチサイズはこの約数にしたい
デフォルトは小さすぎたので、60に変更した。

また、学習率が高く、不安定だったので、大きく下げた。

それに伴い、学習回数も少し増やした。

結果としては、パラメータを変更するだけでかなり精度が上がったので、

#img(
    image("Figures/training_loss_curve_1.png", width: 50%),
    caption: "デフォルトの実行結果"
)

#img(
    image("Figures/training_loss_curve_final.png", width: 50%),
    caption: "最終的な実行結果"
)

グラフをみると、途中で折れている点が少し早くなっている。

これは、パラメータを変更したことで局所的な最適領域に早く到達したと思われる

さらなる変更点の候補としては、ReLU関数の変更、途中の隠れ層の増加、ドロップアウト追加などが考えられる。

#pagebreak()

= 付録
== 変更履歴

デフォルトで実行

Epoch [3] complete. Avg loss: 0.6207

Training completed in 39.04 seconds
Test Accuracy: 78.03%

学習率を0.01 → 0.001

Epoch [3] complete. Avg loss: 0.3643

Training completed in 37.19 seconds
Test Accuracy: 84.28%

バッチサイズを8 → 32

Epoch [3] complete. Avg loss: 0.3621

Training completed in 16.56 seconds
Test Accuracy: 85.36%

バッチサイズを32 → 64

Epoch [3] complete. Avg loss: 0.3689

Training completed in 13.61 seconds
Test Accuracy: 85.69%

隠れ層ノード数を32 → 128

Epoch [3] complete. Avg loss: 0.3384

Training completed in 13.42 seconds
Test Accuracy: 86.19%

ドロップアウトを追加

バッチサイズを64 → 60, エポック数を3 → 5に変更

Epoch [5] complete. Avg loss: 0.2966

Training completed in 23.39 seconds
Test Accuracy: 87.04%

== 実行環境

HAKUSANおよびSingularityイメージを用いて実験を行う予定だったが、
外部リポジトリになぜか接続できなかったので、ローカル環境（WSL2 + Docker + CUDA対応GPU）で実験を行った。

#img(
    image("Figures/スクリーンショット 2026-06-05 231909.png", width: 78%)
)

```
monjirou@monjirou:~/class/i112/report3$ nvidia-smi
Fri Jun  5 23:15:20 2026
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 590.57                 Driver Version: 591.86         CUDA Version: 13.1     |
+-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GeForce RTX 4070        On  |   00000000:01:00.0  On |                  N/A |
|  0%   45C    P5             14W /  200W |    1740MiB /  12282MiB |      9%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+

+-----------------------------------------------------------------------------------------+
| Processes:                                                                              |
|  GPU   GI   CI              PID   Type   Process name                        GPU Memory |
|        ID   ID                                                               Usage      |
|=========================================================================================|
|    0   N/A  N/A              41      G   /Xwayland                             N/A      |
+-----------------------------------------------------------------------------------------+
```

// = メモ

// レポート課題
// 題材: Fashion-MNIST を対象としたモデル学習
// 課題: ハイパーパラメータ・チューニングによる汎化性能の向上
// レポート記載事項:
// 実行環境（CPU/GPU）、所要時間、チューニング内容と工夫点、
// テスト精度と考察
// 締切と提出方法:
// 締切: 2026 年6 月5 日23:59
// 提出方法: LMS のレポート3 にアップロード
// 提出物: YOURID submission.tar.gz
// YOURID を自分のID(s261...) に変更
// 出力結果(.out ファイル)、レポート文書(PDF/課題名・氏名・学
// 籍番号等を記載/本文は自由形式) を格納