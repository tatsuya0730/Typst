#import "../format/report_format.typ": *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/codelst:2.0.0": sourcecode
// #import "@preview/physica:0.9.2"

#show: master_thesis.with(
  title: "池田研",
  subtitle: "進捗報告",
  author: "Tatsuya Kawaguchi",
  id: "2510414",
  university: "JAIST",
  bibliography-file: "../bib/PR_0604.bib",
)

今回はあまり進捗はないが、改めて僕の研究テーマ、研究目的を述べてから、
研究進捗の方を発表したいと思う。

= 研究目的

近年のゲームAIはただ人間に勝つためではなく、プレイヤーを楽しませる方向にシフトしている。
プレイヤーを楽しませる研究は数多く存在する一方で、「感動」を直接目的としたゲームAI研究は、私の調査した範囲では確認できなかった。
その理由として、日本語で「感動」という名詞表現が英語に存在せず、研究分野として確立されなかったことが考えられる。
そこで、研究テーマとしては、プレイヤーに届ける感動体験を機械学習を用いて向上することを目的とする。

= 研究テーマ

ゲームの題材としてはコマンドRPGの戦闘を対象とする。
RPGの戦闘で感動できる要素といえば、例えばHPギリギリで耐えて会心の一撃で倒すことや、
頼れなかった味方が最後に活躍するといった展開が考えられる。

RPGの設計としては、勇者パーティとボスの戦闘のみを対象とし、
ストーリーや探索などは含まない予定。
また、感動の一要素として仲間の成長という要素も重要であると考えているので、
一緒に戦ってくれる味方NPCも想定。

= 感動の定義

では感動とは具体的にどのような現象なのか。
感動は単一の感情ではなく、複数の感情が組み合わさった心理状態。
例えば喜び、悲しみ、恐怖などが含まれる。
中でも喜びによる感動が最も頻度が高いと考え、
私の研究ではこの喜びを伴う感動に着目。

私の研究における感動の定義は、プレイヤーの期待・緊張が高まったとき、
ポジティブな結果で生じる情動体験とする。

= 前回の発表

前回の発表では参考になりそうな論文を紹介した。
今後の話に関わるので、軽く振り返る。
この論文は、プレイヤーの感情が目標とする感情曲線に近づくようにレースコースを生成。
この論文における感情はArousal（興奮度）としている。
この論文ではAGAINデータセットというものを使っている。
AGAINデータセットは、様々なジャンルのゲームについて、約100人の被験者がゲームをプレイして、プレイログとその時の興奮度を記録したデータセット。
この論文では、AGAINデータセットを用いて、AGAINデータに含まれないゲームにおいて、
そのプレイログから興奮度を推定している。
この論文で評価できる点としては、感情モデルを作成する段階で新たにアンケートを用いずに学習させていること。
学習にアンケートを用いるとどうしてもコストがかかってしまうので、そこは評価できる。
具体的な感情推定モデルの作成方法は割愛。

= 全体の学習の流れ

続いてこの論文全体の学習の流れについて説明。
まず初めに、AGAINデータセットを用いて感情推定モデルを作成
次にデザイナーAIがコースを生成
次に生成されたコースをテストAIが自動走行、その時のプレイログを記録
次にプレイログを感情モデルに入力、すると、感情モデルがプレイヤーの感情変化を予測
これが、あらかじめ決定した目標曲線に近づくようにデザイナーAIを強化学習。

= 研究手法

このアイディアを参考にした、私の研究案について説明。
まず感情推定モデルは既存のデータセットから作成。
とりあえずはAGAINデータで考えているが、別のデータセットを使うことも検討。
ここで注意したいのは、感情推定モデルの精度向上自体は目的とせず、推定結果に合う展開に制御することが目的。

続いて、DesignerAIの部分は、ボスや味方の行動、ゲーム内の確率などを操作するイベントを生成するAI。
プレイヤーの感情に合わせてイベントを生成。

そして、TestAIは勇者にあたる。
これは現状、ルールベースでいくつかのパターンを用意するつもり。

= 1ターンの流れ

続いて1ターンの流れについて説明。
まず感情推定モデルを事前に作成。
次にイベント生成AIがボスやNPCの行動、確率を選ぶ。
次に勇者AIがコマンドを選ぶ。
ここでゲーム進行が終わり、このプレイログを記録。
プレイログを感情推定モデルに入力し、感情を推定。
この感情曲線が、目標とする感情曲線との差から報酬を計算し、イベント生成AIに与え、パラメータを更新。

これを繰り返して学習を行う。

= AGAINデータの中身

今回は感情推定モデルの作成に向けて、AGAINデータセットに含まれる特徴量の分析を行った。
AGAINデータにはレースゲーム、シューティングゲーム、2D横スクロールアクションゲームが含まれている一方で、RPGは含まれていない。
そこで、特徴量の中に、RPGでも利用できそうな特徴量が存在するか調査し、AGAINデータをRPGの感情推定モデルに適用できる可能性を検討した。

AGAINデータには、generalという、ゲームジャンルを問わない特徴量と、ゲームジャンルごとに固有の特徴量に分けられる。

元のAGAINデータはcsvファイルだが、ラベルの順番がわかりにくかったので、
一度整理した。

AGAINデータセットに含まれる特徴量の多くは、それが具体的にどういう意味なのか公開されていなかった。
次は著者に直接メールをして聞こうと思う。

= 各特徴量と興奮度の相関

続いて、各特徴量と興奮度の相関についてのグラフを示す。

例えばスコアや経過時間などは、僕が以前やったミニ研究での実験結果とかなり近い結果が得られている。

プレイヤーの体力と興奮度に負の相関が強くみられるのは、
体力が減るにつれて緊張が増し、興奮するという直感にも合ってる。

= 現状の課題

調べてみてわかったことは、まずRPGがゲームジャンルに含まれていないので、適用するのがかなり難しそうということ。
だが、ゲームジャンルを問わない特徴量もあったので、やってみる価値はありそう。

また、各特徴量の詳しい定義が載ってないものもあったので、使える特徴量が少ない。

#pagebreak()

= AGAINの中身

== 対象ゲーム

3ジャンル9種類のゲーム

- レースゲーム
  - TinyCars: 見下ろし型アーケードレース
  - Solid: 1人称ラリーゲーム
  - ApexSpeed: 3人称高速レース

- シューティングゲーム
  - Heist!: FPS
  - Shootout: シューティングギャラリー
  - TopDown: 見下ろし型シューティング

- プラットフォーマー（2D横スクロールアクション）
  - Run'N'Gun: 
  - Pirates!: マリオ風横スクロール
  - Endless: エンドレスランナー


  = デフォルトの順番

[control]genre,
[control]player_id,
[control]session_id,
[control]game,
[control]time_index,
[control]epoch,
[control]time_stamp,
[control]engine_tick,
[output]arousal,
[general]time_passed, ゲーム開始からの経過時間
[general]input_intensity, キー入力回数
[general]input_diversity, 入力キーの種類数
[general]activity, 入力していない割合
[general]score, スコア
[general]bot_count, 見えている敵の数
[general]bot_diversity, 見えている敵の種類数
[general]bot_movement, 敵の移動量
[general]player_movement, プレイヤーの移動量
[general]object_intensity, オブジェクト数
[general]object_diversity, オブジェクトの種類数
[general]event_intensity, イベント数
[general]event_diversity, イベントの種類数
[string]key_presses,
[string]player_aim_target,
[string]bot_damaged_by,
key_press_count,
idle_time,
player_score, プレイヤースコア
player_kill_count, 倒した敵の数
player_speed_x, x方向速度
player_speed_y, y方向速度
player_speed_z, z方向速度
player_delta_distance, 前フレームからの移動距離
player_delta_rotation, 前フレームからの回転量
player_health, プレイヤーHP
player_healing, ?回復中（0/1なら回復中っぽい）
player_damaged, ???プレイヤーダメージ（受けたダメージ量？）
player_shooting, 射撃中（0/1ってこと？）
player_reloading, リロード中（0/1ってこと？）
player_projectile_count, ?プレイヤー弾数
player_projectile_distance, ?プレイヤーから弾までの距離（敵の弾？）
reticle_delta_distance, 照準移動距離
player_crouching, しゃがみ状態
player_sprinting, ダッシュ状態
player_aim_at_enemy, ?敵を照準している（0/1かどうか）
player_aim_at_destructible, ?破壊可能物を照準（0/1かどうか）
player_health_pickup,
visible_bot_count, 画面内敵数
bot_speed_x, 敵のx方向速度
bot_speed_y, 敵のy方向速度
bot_speed_z, 敵のz方向速度
bot_delta_distance, 敵の前フレームからの移動距離
bot_delta_rotation , 敵の前フレームからの回転量
bot_health, 敵HP平均
bot_damaged, ???敵のダメージ量
bot_shooting, 敵が射撃中
bot_reloading, 敵がリロード中
bot_projectile_count, ?敵のプレイヤー弾数
bot_projectile_player_distance, ?敵のプレイヤーから弾までの距離（敵の弾？）
bot_aim_at_player, 敵がプレイヤーを狙っている（0/1かどうか）
pick_ups_visible, ??見えているpickup数（pickupってなに？）
pick_up_player_disctance, ?pickupまでの距離
destructible_count, 破壊可能オブジェクト数
objects_destroyed, 破壊済みオブジェクト数
player_death, 死亡イベント
player_tries_shoot_on_reload, リロード中に射撃入力したか（0/1かどうか）
player_standing, 静止中
player_speed, 速度の大きさ
player_speed_boost, 加速状態
player_is_grounded, 接地中
player_is_mid_air, 空中
player_is_looping, ループ通過中
player_is_crashing, 衝突中
player_is_off_road, コース外にいる
player_gas_pedal, アクセル入力
player_steering, ハンドル入力
player_lap, 現在のラップ数
player_distance_to_way_point,
player_respawn, ?リスポーンイベント（0/1かどうか）
bot_standing, 敵が静止中
bot_score, 敵スコア平均
bot_speed, 敵速度平均
bot_speed_boost, 敵加速状態
bot_is_grounded, 敵が接地中
bot_is_looping, 敵がループ中
bot_is_off_road, 敵がコース外にいる
bot_is_crashing, 敵が衝突中
bot_gas_pedal, 敵がアクセル入力
bot_steering, 敵がハンドル入力
bot_lap, 敵のラップ平均
bot_distance_to_way_point,
bot_delta_rotation, !!!この変数はダブってる（これはミス？）
bot_player_distance, 敵との距離平均
bot_respawn, ?敵リスポーンイベント（0/1かどうか）
visible_jump_count, 見えているジャンプ台数
visible_speed_boost_count, 見えている加速床数
visible_obstacle_count, 見えている障害物数
visible_loop_count, 見えているループ数
[string]player_damaged_by,
[string]bot_types,
[string]pick_up_types,
player_has_collisions, ???衝突がある
player_is_colliding_above, ???上方向に衝突している
player_is_colliding_below, ???下方向に衝突している
player_is_colliding_left, ???左方向に衝突している
player_is_colliding_right, ???右方向に衝突している
player_is_falling, 落下中（0/1かどうか）
player_is_jumping, ジャンプ中（0/1かどうか）
player_point_pickup, ???ポイントを獲得した数
player_power_pickup, ???パワーを獲得した数
player_boost_pickup, ???ブーストを獲得した数
player_slow_pickup, ???スローを獲得した数
player_has_powerup, ???パワーアップをもっているか
bot_has_collisions, ???敵が衝突がある
bot_is_colliding_above, ???敵が上方向に衝突している
bot_is_colliding_below, ???敵が下方向に衝突している
bot_is_colliding_left, ???敵が左方向に衝突している
bot_is_colliding_right, ???敵が右方向に衝突している
bot_is_falling, 敵が落下中（0/1かどうか）
bot_is_jumping, 敵がジャンプ中（0/1かどうか）
bot_charging ???敵がチャージ中

#pagebreak()

= ジャンル分け

// 出力（興奮度の変化量）
[output]arousal,

// 全ジャンル共通の特徴量
[general]time_passed, ゲーム開始からの経過時間
[general]input_intensity, キー入力回数
[general]input_diversity, 入力キーの種類数
[general]activity, 入力していない割合
[general]score, スコア
[general]bot_count, 見えている敵の数
[general]bot_diversity, 見えている敵の種類数
[general]bot_movement, 敵の移動量
[general]player_movement, プレイヤーの移動量
[general]object_intensity, オブジェクト数
[general]object_diversity, オブジェクトの種類数
[general]event_intensity, イベント数
[general]event_diversity, イベントの種類数

// タグなし特徴量
// 全ジャンル
// キー入力
key_press_count, ???キー入力回数
idle_time, ???キー入力の無かった時間
// プレイヤー
player_score, プレイヤースコア
player_delta_distance, 前フレームからの移動距離
//敵
bot_delta_distance, 敵の前フレームからの移動距離
visible_bot_count, 画面内敵数


// プラットフォーマー/FPS
// プレイヤー
player_kill_count, 倒した敵の数
player_speed_x, x方向速度
player_speed_y, y方向速度
player_health, プレイヤーHP
player_damaged, ???プレイヤーダメージ（受けたダメージ量？）
player_shooting, 射撃中（0/1ってこと？）
player_projectile_count, ?プレイヤー弾数
player_projectile_distance, ?プレイヤーから弾までの距離（敵の弾？）
player_health_pickup, 体力を獲得した回数
// 敵
bot_speed_x, 敵のx方向速度
bot_speed_y, 敵のy方向速度
bot_health, 敵HP平均
bot_damaged, ???敵のダメージ量
bot_shooting, 敵が射撃中
bot_projectile_count, ?敵の弾数
bot_projectile_player_distance, ?敵の弾までの距離（敵の弾？）
pick_ups_visible, ??見えているpickup数（pickupってなに？）
pick_up_player_disctance, ?pickupまでの距離
player_death, 死亡イベント

// プラットフォーマー/レース
// プレイヤー
player_is_grounded, 接地中
bot_player_distance, 敵との距離平均
// 敵
bot_is_grounded, 敵が接地中 

// レース/FPS
player_delta_rotation, 前フレームからの回転量


// レースのみ
//プレイヤー
player_standing, 静止中
player_speed, 速度の大きさ
player_speed_boost, 加速状態
player_is_mid_air, 空中
player_is_looping, ループ通過中
player_is_crashing, 衝突中
player_is_off_road, コース外にいる
player_gas_pedal, アクセル入力
player_steering, ハンドル入力
player_lap, 現在のラップ数
player_distance_to_way_point, チェックポイントまでの距離
player_respawn, ?リスポーンイベント（0/1かどうか）
// 敵
bot_standing, 敵が静止中
bot_score, 敵スコア平均
bot_speed, 敵速度平均
bot_speed_boost, 敵加速状態
bot_is_looping, 敵がループ中
bot_is_off_road, 敵がコース外にいる
bot_is_crashing, 敵が衝突中
bot_gas_pedal, 敵がアクセル入力
bot_steering, 敵がハンドル入力
bot_lap, 敵のラップ平均
bot_distance_to_way_point, 敵のチェックポイントまでの距離
bot_delta_rotation, 敵の前フレームからの回転量（同じ名前の特徴量があるが、定義が違う可能性あり）
bot_respawn, ?敵リスポーンイベント（0/1かどうか）
// visible
visible_jump_count, 見えているジャンプ台数
visible_speed_boost_count, 見えている加速床数
visible_obstacle_count, 見えている障害物数
visible_loop_count, 見えているループ数

// FPSのみ
//プレイヤー
player_speed_z, z方向速度
player_healing, ?回復中（0/1なら回復中っぽい）
player_reloading, リロード中（0/1ってこと？）
reticle_delta_distance, 照準移動距離
player_crouching, しゃがみ状態
player_sprinting, ダッシュ状態
player_aim_at_enemy, ?敵を照準している（0/1かどうか）
player_aim_at_destructible, ?破壊可能物を照準（0/1かどうか）
player_tries_shoot_on_reload, リロード中に射撃入力したか（0/1かどうか）
// 敵
bot_speed_z, 敵のz方向速度
bot_delta_rotation , 敵の前フレームからの回転量（同じ名前の特徴量があるが、定義が違う可能性あり）
bot_reloading, 敵がリロード中
bot_aim_at_player, 敵がプレイヤーを照準している（0/1かどうか）
// オブジェクト
destructible_count, 破壊可能オブジェクト数
objects_destroyed, 破壊済みオブジェクト数

// プラットフォーマーのみ
// プレイヤー
player_has_collisions, ???衝突がある
player_is_colliding_above, ???上方向に衝突している
player_is_colliding_below, ???下方向に衝突している
player_is_colliding_left, ???左方向に衝突している
player_is_colliding_right, ???右方向に衝突している
player_is_falling, 落下中（0/1かどうか）
// 定義があいまいなので使えないかも
player_is_jumping, ジャンプ中（0/1かどうか）
player_point_pickup, ???ポイントを獲得した数
player_power_pickup, ???パワーを獲得した数
player_boost_pickup, ???ブーストを獲得した数
player_slow_pickup, ???スローを獲得した数
player_has_powerup, ???パワーアップをもっているか
// 敵
bot_has_collisions, ???敵が衝突がある
bot_is_colliding_above, ???敵が上方向に衝突している
bot_is_colliding_below, ???敵が下方向に衝突している
bot_is_colliding_left, ???敵が左方向に衝突している
bot_is_colliding_right, ???敵が右方向に衝突している
bot_is_falling, 敵が落下中（0/1かどうか）
bot_is_jumping, 敵がジャンプ中（0/1かどうか）
bot_charging ???敵がチャージ中


// 使わない
// 制御用の変数（機械学習には使用しない）
[control]genre,
[control]player_id,
[control]session_id,
[control]game,
[control]time_index,
[control]epoch,
[control]time_stamp,
[control]engine_tick,

// 文字列の特徴量,（使いにくそう）
[string]key_presses,
[string]player_aim_target,
[string]bot_damaged_by,
// 
[string]player_damaged_by,
[string]bot_types,
[string]pick_up_types,