#import "../format/report_format.typ": *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/codelst:2.0.0": sourcecode
// #import "@preview/physica:0.9.2"

#show: master_thesis.with(
  title: "OS特論",
  subtitle: "テスト問題",
  author: "Tatsuya Kawaguchi",
  id: "2510414",
  university: "JAIST",
//   bibliography-file: "../bib/PR_0604.bib",
)

= Introduction

1:

英文:

What are the two main functions of an operating system?

日本語訳:

オペレーティングシステムの主な機能を2つ挙げよ。

解答:

OSの主な機能は、CPUやメモリなどの資源を管理することと、ハードウェアの複雑さを隠して利用しやすい環境を提供することである。

2:

英文:

In Section 1.4, nine different types of operating systems are described. Give a list of applications for each of these systems (one per operating systems type).

日本語訳:

1.4節で説明された9種類のOSについて、それぞれの利用例を1つ挙げよ。

解答:

メインフレームOSは銀行システム、サーバOSはWebサーバ、マルチプロセッサOSはスーパーコンピュータ、PC向けOSはノートPC、携帯機器向けOSはスマートフォン、組込みOSは家電製品、センサノードOSは環境監視センサ、リアルタイムOSは自動車制御、スマートカードOSはICカードで利用される。

3:

英文:

What is the difference between timesharing and multiprogramming systems?

日本語訳:

タイムシェアリングシステムとマルチプログラミングシステムの違いは何か。

解答:

マルチプログラミングはCPU利用率の向上を目的として複数のプログラムを切り替えて実行する方式であり、タイムシェアリングは複数の利用者に対して短い応答時間を提供することを目的とした方式である。

4:

英文:

What is the advantage of caching an entire cache line instead of a single byte or word at a time?

日本語訳:

1バイトや1ワードではなく、キャッシュライン全体をキャッシュする利点は何か。

解答:

近くのメモリ領域が続けて参照されることが多いため、キャッシュライン全体を読み込むことでキャッシュミスを減らし、アクセス速度を向上できる。

5:

英文:

On early computers, every byte of data read or written was handled by the CPU (i.e., there was no DMA). What implications does this have for multiprogramming?

日本語訳:

初期のコンピュータではDMAがなく、読み書きする全データをCPUが処理していた。これはマルチプログラミングにどのような影響を与えるか。

解答:

I/O処理中もCPUがデータ転送を担当するため、他のプログラムを実行する余裕が減り、マルチプログラミングの効果が小さくなる。

6:

英文:

Instructions related to accessing I/O devices are typically privileged instructions. Give a reason why these instructions are privileged.

日本語訳:

I/O装置へアクセスする命令は通常特権命令である。その理由を述べよ。

解答:

ユーザプログラムが自由にI/O装置を操作すると、データ破壊やシステム障害を引き起こす可能性があるため、OSのみが実行できるようにしている。

7:

英文:

The family-of-computers idea was introduced in the 1960s with the IBM System/360 mainframes. Is this idea now dead as a doornail or does it live on?

日本語訳:

IBM System/360で導入された「コンピュータファミリー」の考え方は現在も生きているか。

解答:

現在も生きている。同じ命令セットを共有しながら性能の異なる製品を提供するx86やARMシリーズはその代表例である。

8:

英文:

One reason GUIs were initially slow to be adopted was the cost of the hardware needed to support them. How much video RAM is needed to support a 25-line × 80-row character monochrome text screen? How much for a 1200 × 900-pixel 24-bit color bitmap? What was the cost of this RAM at 1980 prices (\$5/KB)? How much is it now?

日本語訳:

GUIが普及するのが遅れた理由の1つは、それを支えるハードウェアが高価だったためである。25行×80列のモノクロ画面と1200×900ピクセル24ビットカラー画面に必要なビデオRAM量、および1980年当時と現在のおおよその価格を求めよ。

解答:

モノクロ画面には約2KB、カラー画面には約3.24MBのビデオRAMが必要である。1980年当時の価格では約16,200ドルになるが、現在ではごくわずかな金額で実現できる。

9:

英文:

There are several design goals in building an operating system, for example, resource utilization, timeliness, robustness, and so on. Give an example of two design goals that may contradict one another.

日本語訳:

OS設計には資源利用率、応答性、堅牢性などの目標がある。互いに矛盾する可能性がある設計目標の例を挙げよ。

解答:

性能とセキュリティはしばしば矛盾する。セキュリティを高めるための検査を増やすと、処理速度が低下する場合がある。

10:

英文:

What is the difference between kernel and user mode? Explain how having two distinct modes aids in designing an operating system.

日本語訳:

カーネルモードとユーザモードの違いは何か。また、2つのモードを持つことがOS設計にどのように役立つか説明せよ。

解答:

カーネルモードではOSが特権命令やハードウェアを直接操作できるが、ユーザモードでは制限される。この分離により、ユーザプログラムによるシステム破壊を防ぎ、安全性と安定性を向上できる。

11:


英文:

A 255-GB disk has 65,536 cylinders with 255 sectors per track and 512 bytes per sector. How many platters and heads does this disk have? Assuming an average cylinder seek time of 11 ms, average rotational delay of 7 ms and reading rate of 100 MB/sec, calculate the average time it will take to read 400 KB from one sector.

日本語訳:

255GBのディスクは65,536シリンダ、1トラックあたり255セクタ、1セクタあたり512バイトを持つ。このディスクのプラッタ数とヘッド数を求めよ。また、平均シーク時間11ms、平均回転待ち時間7ms、読込み速度100MB/sのとき、400KBを読み出す平均時間を求めよ。

解答:

総容量は約255GBであり、1シリンダ当たりの容量から計算するとヘッド数は32本となる。したがってプラッタ数は16枚である。400KBの転送時間は約4msなので、平均読込み時間は11+7+4=22msである。

12.

英文:

Which of the following instructions should be allowed only in kernel mode?
(a) Disable all interrupts.
(b) Read the time-of-day clock.
(c) Set the time-of-day clock.
(d) Change the memory map.

日本語訳:

次の命令のうち、カーネルモードでのみ許可すべきものはどれか。
(a) すべての割込みを禁止する
(b) 時刻を読む
(c) 時刻を設定する
(d) メモリマップを変更する

解答:

(a)、(c)、(d)はカーネルモード専用である。(b)は読み取りのみなのでユーザモードでも許可できる。

13:


英文:

Consider a system that has two CPUs, each CPU having two threads (hyperthreading). Suppose three programs, P0, P1, and P2, are started with run times of 5, 10 and 20 msec, respectively.

日本語訳:

2個のCPUがあり、それぞれ2スレッドのハイパースレッディングを持つシステムを考える。P0、P1、P2の実行時間はそれぞれ5ms、10ms、20msである。

解答:

実行可能なハードウェアスレッドは4本あるため、3つのプログラムは同時に実行できる。最も長いP2が20msで終了するため、全体の実行時間は20msである。

14:


英文:

A computer has a pipeline with four stages. Each stage takes the same time to do its work, namely, 1 nsec. How many instructions per second can this machine execute?

日本語訳:

4段パイプラインを持つコンピュータがある。各段の処理時間は1nsである。この機械は1秒間に何命令実行できるか。

解答:

パイプラインが満たされた後は1nsごとに1命令完了するため、毎秒10億命令、すなわち1GIPSである。

15:


英文:

Consider a computer system that has cache memory, main memory (RAM) and disk...

日本語訳:

キャッシュ、主記憶、ディスクを持つ仮想記憶システムについて、平均アクセス時間を求めよ。

解答:

平均アクセス時間は、
0.95×1ns + 0.05×(0.99×10ns + 0.01×10ms)
となる。計算すると約5001ns、すなわち約5μsである。

16:


英文:

When a user program makes a system call to read or write a disk file...

日本語訳:

ユーザプログラムがディスクファイルに対してreadやwriteを実行した場合、writeでは呼び出し元を必ずブロックする必要があるか。

解答:

必ずしもブロックする必要はない。OSがデータをカーネルバッファへコピーした後であれば、実際のディスク書込み完了を待たずに呼び出し元へ制御を返せる。

17:


英文:

What is a trap instruction? Explain its use in operating systems.

日本語訳:

トラップ命令とは何か。またOSでどのように利用されるか説明せよ。

解答:

トラップ命令は意図的に例外を発生させてカーネルへ制御を移す命令である。主にシステムコールを実現するために利用される。

18:


英文:

Why is the process table needed in a timesharing system? Is it also needed in personal computer systems running UNIX or Windows with a single user?

日本語訳:

タイムシェアリングシステムでプロセステーブルが必要な理由は何か。また、単一ユーザのUNIXやWindowsでも必要か。

解答:

プロセステーブルは各プロセスの状態や資源情報を管理するために必要である。単一ユーザ環境でも複数プロセスが同時実行されるため必要である。

19:


英文:

Is there any reason why you might want to mount a file system on a nonempty directory?

日本語訳:

空でないディレクトリにファイルシステムをマウントしたい理由はあるか。

解答:

ある。マウントポイントとして利用するためであり、マウント後は元の内容が一時的に隠されるが、アンマウントすると再び見える。

20:


英文:

For each of the following system calls, give a condition that causes it to fail:
 fork, exec, and unlink.

日本語訳:

fork、exec、unlinkが失敗する条件をそれぞれ1つ挙げよ。

解答:

forkはプロセス数やメモリの上限に達した場合に失敗する。execは指定した実行ファイルが存在しない場合や実行権限がない場合に失敗する。unlinkは対象ファイルへの削除権限がない場合に失敗する。

21:

英文:

What type of multiplexing (time, space, or both) can be used for sharing the following resources:
 CPU, memory, disk, network card, printer, keyboard, and display?

日本語訳:

CPU、メモリ、ディスク、ネットワークカード、プリンタ、キーボード、ディスプレイは、それぞれ時間多重化・空間多重化・その両方のどれで共有できるか。

解答:

CPUは時間多重化、メモリは空間多重化、ディスクは時間多重化と空間多重化の両方、ネットワークカードは時間多重化、プリンタは時間多重化、キーボードは時間多重化、ディスプレイは時間多重化と空間多重化の両方で共有できる。

22:

英文:

Can the count = write(fd, buffer, nbytes); call return any value in count other than nbytes? If so, why?

日本語訳:

write(fd, buffer, nbytes) の戻り値countはnbytes以外になることがあるか。あるならその理由を述べよ。

解答:

ある。ディスク容量不足やシグナルによる割込みなどにより、一部のデータしか書き込めなかった場合は、実際に書き込まれたバイト数が返される。

23:

英文:

A file whose file descriptor is fd contains the following sequence of bytes:
 3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5. The following system calls are made:

lseek(fd, 3, SEEK_SET);
read(fd, &buffer, 4);

日本語訳:

ファイルfdに 3,1,4,1,5,9,2,6,5,3,5 が格納されている。lseek(fd,3,SEEK_SET) の後に read(fd,&buffer,4) を実行したとき、bufferの内容は何か。

解答:

先頭から3バイト目へ移動するため、読み出される4バイトは 1,5,9,2 である。

24:

英文:

Suppose that a 10-MB file is stored on a disk on the same track in consecutive sectors. The disk arm is currently situated over track number 100. How long will it take to retrieve this file from the disk?

日本語訳:

10MBのファイルが同一トラック上の連続セクタに保存されている。ディスクアームは現在トラック100上にあり、ファイルはトラック50にある。ファイル取得時間を求めよ。

解答:

シーク時間は50ms、回転待ち時間は5ms、転送時間は10MB÷200MB/s=50msである。したがって合計105msとなる。

25:

英文:

What is the essential difference between a block special file and a character special file?

日本語訳:

ブロックスペシャルファイルとキャラクタスペシャルファイルの本質的な違いは何か。

解答:

ブロックデバイスは固定長ブロック単位でアクセスできランダムアクセスが可能である。一方、キャラクタデバイスは文字列の流れとして扱われ、通常は順次アクセスを行う。

26:

英文:

In the example given in Fig. 1-17, the library procedure is called read and the system call itself is called read. Is it essential that both of these have the same name?

日本語訳:

図1-17ではライブラリ関数もシステムコールもreadという名前である。同じ名前である必要はあるか。

解答:

同じ名前である必要はない。プログラマが直接利用するライブラリ関数の名前の方が重要であり、内部で呼ばれるシステムコール名は異なっていてもよい。

27:

英文:

Modern operating systems decouple a process address space from the machine’s physical memory. List two advantages of this design.

日本語訳:

現代のOSではプロセスのアドレス空間と物理メモリを分離している。この設計の利点を2つ挙げよ。

解答:

各プロセスを互いに保護できることと、実メモリ容量より大きな仮想アドレス空間を利用できることである。

28:

英文:

To a programmer, a system call looks like any other call to a library procedure. Is it important that a programmer know which library procedures result in system calls?

日本語訳:

システムコールは通常のライブラリ呼び出しと同じように見える。どのライブラリ関数がシステムコールを発行するかを知ることは重要か。

解答:

性能が重要な場合には重要である。システムコールはユーザモードとカーネルモードの切替を伴うため、通常の関数呼び出しよりも高コストである。

29:

英文:

Figure 1-23 shows that a number of UNIX system calls have no Win32 API equivalents. For each of the calls listed as having no Win32 equivalent, what are the consequences for a programmer of converting a UNIX program to run under Windows?

日本語訳:

図1-23ではいくつかのUNIXシステムコールに対応するWin32 APIが存在しない。UNIXプログラムをWindowsへ移植する際にどのような影響があるか。

解答:

対応する機能を別のAPIで実装するか、場合によってはプログラムの設計そのものを変更する必要があるため、移植作業が複雑になる。

30:

英文:

A portable operating system is one that can be ported from one system architecture to another without any modification. Explain why it is infeasible to build an operating system that is completely portable.

日本語訳:

移植可能なOSとは別アーキテクチャへ移植できるOSである。完全に移植可能なOSを作ることが不可能な理由と、高い移植性を実現するための2つの層を説明せよ。

解答:

CPU命令や割込み処理などハードウェア依存部分が存在するため、完全な移植性は実現できない。高い移植性のためには、ハードウェア依存層とハードウェア非依存層を分離して設計する。

31:

英文:

Explain how separation of policy and mechanism aids in building microkernel-based operating systems.

日本語訳:

方針と機構を分離することが、マイクロカーネル型OSの構築にどのように役立つか説明せよ。

解答:

カーネルは基本機能のみを提供し、資源管理方針などをユーザ空間のサーバへ任せられるため、柔軟性や保守性が向上する。

32:

英文:

Virtual machines have become very popular for a variety of reasons. Nevertheless, they have some downsides. Name one.

日本語訳:

仮想マシンは広く利用されているが欠点もある。1つ挙げよ。

解答:

仮想化処理のオーバーヘッドにより、ネイティブ実行より性能が低下する場合がある。

33:

英文:

Here are some questions for practicing unit conversions.

日本語訳:

次の単位変換を行え。

解答:

(a) ナノ年は約0.0315秒である。
(b) メガミクロンは1メートルである。
(c) 1PBは10^15バイトである。
(d) 6000ヨタグラムは6×10^24kgである。

34:

英文:

Write a shell that is similar to Fig. 1-19 but contains enough code that it actually works so you can test it.

日本語訳:

図1-19に似たシェルを実際に動作するよう実装せよ。

解答:

プログラミング課題のため記述式の解答はない。fork、exec、waitを用いてコマンド実行を行うシェルを実装する。

35:

英文:

Write a shell script that attempts to create an unlimited number of child processes and observe what happens.

日本語訳:

無制限に子プロセスを生成しようとするシェルスクリプトを作成し、何が起こるか観察せよ。

解答:

プロセス数の上限やメモリ不足に達すると新しいプロセスの生成に失敗する。システムによっては著しい性能低下が発生する。

36:

英文:

Examine and try to interpret the contents of a UNIX-like or Windows directory with a tool like the UNIX od program.

日本語訳:

UNIX系またはWindowsのディレクトリ内容をodなどのツールで調べ、その内容を解釈せよ。

解答:

ディレクトリにはファイル名やinode番号、属性情報などが格納されていることを確認できる。具体的な内容はファイルシステムの種類によって異なる。

#pagebreak()

= Processes and threads

1:

英文:

In Fig. 2-2, three process states are shown. In theory, with three states, there could be six transitions, two out of each state. However, only four transitions are shown. Are there any circumstances in which either or both of the missing transitions might occur?

日本語訳:

図2-2では3つのプロセス状態が示されている。理論上は6個の状態遷移が存在し得るが、図には4個しかない。欠けている遷移が起こる可能性はあるか。

解答:

通常は起こらないが、システム設計によってはReadyからBlockedやBlockedからRunningへ直接遷移する実装も考えられる。

2:

英文:

Suppose that you were to design an advanced computer architecture that did process switching in hardware, instead of having interrupts. What information would the CPU need? Describe how the hardware process switching might work.

日本語訳:

割込みではなくハードウェアでプロセス切替を行うコンピュータを設計するとしたら、CPUにはどのような情報が必要か。またどのように動作するか説明せよ。

解答:

CPUは各プロセスのレジスタ、プログラムカウンタ、スタックポインタなどの状態情報を保持する必要がある。切替時には現在の状態を保存し、次のプロセスの状態を復元する。

3:

英文:

On all current computers, at least part of the interrupt handlers are written in assembly language. Why?

日本語訳:

現在のコンピュータでは割込みハンドラの一部がアセンブリ言語で書かれているのはなぜか。

解答:

割込み発生直後はレジスタ保存やハードウェア制御を直接行う必要があり、高級言語では十分に制御できないためである。

4:

英文:

When an interrupt or a system call transfers control to the operating system, a kernel stack area separate from the stack of the interrupted process is generally used. Why?

日本語訳:

割込みやシステムコールでOSへ制御が移る際、なぜ独立したカーネルスタックを使用するのか。

解答:

ユーザスタックが破損している可能性があるためであり、OSの安全性と信頼性を確保するためである。

5:

英文:

A computer system has enough room to hold five programs in its main memory. These programs are idle waiting for I/O half the time. What fraction of the CPU time is wasted?

日本語訳:

5個のプログラムを主記憶に格納でき、それぞれ半分の時間をI/O待ちで過ごす。CPU時間のうち無駄になる割合を求めよ。

解答:

CPUが遊ぶ確率は全プログラムが同時にI/O待ちとなる確率なので、(0.5)^5=0.03125である。したがって無駄になる割合は3.125%である。

6:

英文:

A computer has 4 GB of RAM of which the operating system occupies 512 MB. The processes are all 256 MB and have the same characteristics. If the goal is 99% CPU utilization, what is the maximum I/O wait that can be tolerated?

日本語訳:

4GBのRAMがあり、そのうち512MBをOSが使用する。各プロセスは256MBで同じ特性を持つ。CPU利用率99%を達成するために許容される最大I/O待ち割合を求めよ。

解答:

配置可能なプロセス数は14個である。CPU利用率は1-p^14で表されるため、0.99=1-p^14よりp≈0.72となる。したがって最大I/O待ち割合は約72%である。

7:

英文:

Multiple jobs can run in parallel and finish faster than if they had run sequentially.

日本語訳:

2つのジョブがそれぞれ20分のCPU時間を必要とする場合、逐次実行と並列実行での完了時間を求めよ。

解答:

逐次実行では40分かかる。I/O待ちが50%で並列実行する場合、CPUはほぼ常に有効利用されるため、最後のジョブは約20分で完了する。

8:

英文:

Consider a multiprogrammed system with degree of 6. Assume that each process spends 40% of its time waiting for I/O. What will be the CPU utilization?

日本語訳:

多重度6のマルチプログラミングシステムで、各プロセスが40%の時間をI/O待ちに費やすとき、CPU利用率を求めよ。

解答:

CPU利用率は1-(0.4)^6であり、約99.59%となる。

9:

英文:

Assume that you are trying to download a large 2-GB file from the Internet. Explain how you might use threads to improve the download time.

日本語訳:

2GBの大きなファイルをダウンロードする際、スレッドをどのように利用して時間を短縮できるか説明せよ。

解答:

複数のスレッドを用いてファイルの異なる範囲を同時に複数サーバから取得し、最後に結合することでダウンロード時間を短縮できる。

10:

英文:

In the text it was stated that the model of Fig. 2-11(a) was not suited to a file server using a cache in memory. Why not? Could each process have its own cache?

日本語訳:

図2-11(a)のモデルはメモリキャッシュを用いるファイルサーバには適さないとされている。なぜか。また各プロセスが独自のキャッシュを持つことは可能か。

解答:

各プロセスが独立しているとキャッシュを共有できず、同じデータが重複して保存されてしまう。各プロセスが独自のキャッシュを持つことは可能だが、メモリ効率が悪くなる。

11:

英文:

If a multithreaded process forks, a problem occurs if the child gets copies of all the parent’s threads. Suppose that one of the original threads was waiting for keyboard input. Now two threads are waiting for keyboard input, one in each process. Does this problem ever occur in single-threaded processes?

日本語訳:

マルチスレッドプロセスがforkした際、親の全スレッドが子にコピーされると問題が生じる。例えばキーボード入力待ちのスレッドがあった場合、親子の両方で入力待ちになる。この問題はシングルスレッドプロセスでも起こるか。

解答:

起こらない。シングルスレッドプロセスでは入力待ちのスレッドが1つしか存在しないため、スレッド間の不整合は発生しない。

12:

英文:

In Fig. 2-8, a multithreaded Web server is shown. If the only way to read from a file is the normal blocking read system call, do you think user-level threads or kernel-level threads are being used for the Web server? Why?

日本語訳:

図2-8のマルチスレッドWebサーバにおいて、ファイル読込みがブロッキングreadシステムコールしか利用できない場合、ユーザレベルスレッドとカーネルレベルスレッドのどちらが使われていると考えられるか。

解答:

カーネルレベルスレッドである。ユーザレベルスレッドでは1つのスレッドがブロックされるとプロセス全体が停止してしまうためである。

13:

英文:

Are there any circumstances in which a single-threaded server might be better? Give an example.

日本語訳:

シングルスレッドサーバの方が優れている状況はあるか。例を挙げよ。

解答:

処理量が少なく同時接続数が少ない場合は、スレッド管理のオーバーヘッドがないためシングルスレッドサーバの方が効率的なことがある。

14:

英文:

In Fig. 2-12 the register set is listed as a per-thread rather than a per-process item. Why?

日本語訳:

図2-12ではレジスタ集合がプロセス単位ではなくスレッド単位の項目になっているのはなぜか。

解答:

各スレッドは独立した実行状態を持ち、それぞれ異なるプログラムカウンタやレジスタ内容を保持する必要があるためである。

15:

英文:

Why would a thread ever voluntarily give up the CPU by calling thread yield?

日本語訳:

スレッドがthread yieldを呼んで自発的にCPUを手放す理由は何か。

解答:

他のスレッドへ実行機会を与えたり、共有資源の待機中にCPUを無駄に消費しないようにするためである。

16:

英文:

Can a thread ever be preempted by a clock interrupt? If so, under what circumstances?

日本語訳:

スレッドはクロック割込みによってプリエンプトされることがあるか。あるならどのような場合か。

解答:

カーネルレベルスレッドでは可能である。OSのスケジューラがタイムクォンタム終了時に別スレッドへ切り替えるためである。

17:

英文:

Compare reading a file using a single-threaded file server and a multithreaded server.

日本語訳:

シングルスレッドファイルサーバとマルチスレッドファイルサーバの処理能力を比較せよ。

解答:

シングルスレッドでは平均処理時間は12+75/3=37msなので約27件/秒処理できる。マルチスレッドではI/O待ち中に他の要求を処理できるため、約83件/秒処理できる。

18:

英文:

What is the biggest advantage of implementing threads in user space? What is the biggest disadvantage?

日本語訳:

ユーザ空間でスレッドを実装する最大の利点と欠点は何か。

解答:

利点はスレッド操作が高速でOSの支援を必要としないことである。欠点は1つのスレッドがブロックするとプロセス全体が停止することである。

19:

英文:

In Fig. 2-15 the thread creations and messages printed by the threads are interleaved at random. Is there a way to force the order to be strictly thread 1 created, thread 1 prints message, thread 1 exits, thread 2 created, and so on?

日本語訳:

図2-15ではスレッド生成とメッセージ出力の順序がランダムである。thread1作成→出力→終了→thread2作成→出力→終了という順番を強制できるか。

解答:

できる。親スレッドが各スレッドを生成した後にjoinで終了を待ち、次のスレッドを生成すればよい。

20:

英文:

In the discussion on global variables in threads, we used a procedure create global to allocate storage for a pointer to the variable, rather than the variable itself. Is this essential?

日本語訳:

スレッドにおけるグローバル変数の議論では、変数そのものではなくポインタ用の領域を確保した。これは必須か。

解答:

必須ではない。値そのものを保持する実装も可能であるが、ポインタを用いる方が柔軟に管理できる。

21:

英文:

Consider a system in which threads are implemented entirely in user space, with the run-time system getting a clock interrupt once a second. Suppose that a clock interrupt occurs while some thread is executing in the run-time system. What problem might occur? Can you suggest a way to solve it?

日本語訳:

スレッドが完全にユーザ空間で実装されているシステムを考える。ランタイムシステムが1秒ごとにクロック割込みを受けるとする。ランタイムシステム実行中に割込みが発生した場合、どのような問題が起こるか。また解決策を述べよ。

解答:

ランタイムシステム内部のデータ構造が不整合な状態で切り替えられる可能性がある。ランタイムシステム実行中は割込みを無効化するか、クリティカルセクションを設けて保護する。

22:

英文:

Suppose that an operating system does not have anything like the select system call to see in advance if it is safe to read from a file, pipe, or device, but it does allow alarm clocks to be set that interrupt blocked system calls. Is it possible to implement a threads package in user space under these conditions?

日本語訳:

OSにselectのような機能はないが、アラームによりブロックしたシステムコールを中断できるとする。この条件でユーザレベルスレッドパッケージを実装できるか。

解答:

可能である。アラームを利用してブロックしたシステムコールを中断し、別のスレッドへ切り替えることで実現できる。

23:

英文:

Does the busy waiting solution using the turn variable work when the two processes are running on a shared-memory multiprocessor?

日本語訳:

turn変数を用いたビジーウェイト方式は、共有メモリ型マルチプロセッサでも正しく動作するか。

解答:

相互排他自体は実現できるが、厳密な交互実行を強制してしまうため効率が悪く、正しい解決策とはいえない。

24:

英文:

Does Peterson’s solution to the mutual-exclusion problem work when process scheduling is preemptive? How about when it is nonpreemptive?

日本語訳:

Petersonの相互排他アルゴリズムはプリエンプティブスケジューリングでも動作するか。またノンプリエンプティブではどうか。

解答:

どちらの場合でも正しく動作する。アルゴリズム自体がスケジューリング方式に依存しないためである。

25:

英文:

Can the priority inversion problem discussed in Sec. 2.3.4 happen with user-level threads? Why or why not?

日本語訳:

優先度逆転問題はユーザレベルスレッドでも発生するか。

解答:

発生する可能性がある。高優先度スレッドが低優先度スレッドの保持する資源を待つ状況は、ユーザレベルスレッドでも起こり得るためである。

26:

英文:

Does the same problem occur if round-robin scheduling is used instead of priority scheduling?

日本語訳:

優先度スケジューリングの代わりにラウンドロビン方式を用いた場合も同じ問題は発生するか。

解答:

発生しにくい。すべてのプロセスに均等にCPU時間が与えられるため、低優先度プロセスが永久に実行されない状況は起こらない。

27:

英文:

In a system with threads, is there one stack per thread or one stack per process when user-level threads are used? What about when kernel-level threads are used?

日本語訳:

スレッドシステムでは、ユーザレベルスレッドとカーネルレベルスレッドでスタックはスレッドごとかプロセスごとか。

解答:

どちらの場合も各スレッドごとに独立したスタックが必要である。そうでなければ関数呼び出し状態を保持できない。

28:

英文:

Is it possible for a race condition to occur when there are no simultaneous events, such as in a sequential simulator?

日本語訳:

命令を1つずつ順番に実行するシミュレータのように同時実行が存在しない場合でも競合状態は発生するか。

解答:

発生する可能性がある。実際には同時実行されていなくても、実行順序によって結果が変わる場合は競合状態とみなされる。

29:

英文:

Will the producer-consumer solution presented in Fig. 2-28 using semaphores work for multiple producers and consumers?

日本語訳:

図2-28のセマフォを用いた生産者・消費者問題の解法は、複数の生産者と消費者が存在する場合にも動作するか。

解答:

動作する。セマフォが共有バッファへの排他的アクセスと空き数・使用数の管理を適切に行うためである。

30:

英文:

Consider the following solution to the mutual-exclusion problem involving two processes P0 and P1. Determine if the solution meets all the required conditions for a correct mutual-exclusion solution.

日本語訳:

P0とP1による相互排他問題の解法が与えられている。この解法が正しい相互排他条件を満たすか判定せよ。

解答:

満たさない。相互排他は実現できるが、一方のプロセスがクリティカルセクションに入らない場合でも他方が永久に待たされる可能性があり、進行条件を満たさない。

31:

英文:

How could an operating system that can disable interrupts implement semaphores?

日本語訳:

割込みを禁止できるOSはどのようにセマフォを実装できるか。

解答:

セマフォ操作中に割込みを禁止し、値の更新や待ち行列操作をアトミックに実行することで実装できる。

32:

英文:

Show how counting semaphores can be implemented using only binary semaphores and ordinary machine instructions.

日本語訳:

カウンティングセマフォを、バイナリセマフォと通常の機械命令だけで実装する方法を示せ。

解答:

カウンタ変数を保持し、その更新をバイナリセマフォによる相互排他で保護することで実装できる。

33:

英文:

If a system has only two processes, does it make sense to use a barrier to synchronize them? Why or why not?

日本語訳:

プロセスが2つしかないシステムでバリア同期を使う意味はあるか。

解答:

ある。両プロセスが特定の地点に到達するまで待機させたい場合には、2プロセスでもバリア同期は有効である。

34:

英文:

Can two threads in the same process synchronize using a kernel semaphore if the threads are implemented by the kernel? What if they are implemented in user space?

日本語訳:

同一プロセス内の2つのスレッドはカーネルセマフォで同期できるか。カーネルスレッドの場合とユーザスレッドの場合について述べよ。

解答:

カーネルスレッドなら同期できる。ユーザレベルスレッドでもシステムコール経由で利用できるが、オーバーヘッドが大きくなる。

35:

英文:

Why is a waituntil primitive with an arbitrary Boolean predicate not commonly used instead of wait and signal?

日本語訳:

任意の論理式を条件とするwaituntilが、waitとsignalの代わりに一般的に使われないのはなぜか。

解答:

条件式がいつ真になるかを効率よく判定するのが難しく、実装コストが高いためである。

36:

英文:

A fast-food restaurant has four kinds of employees. What form of interprocess communication do they use? Relate this model to processes in UNIX.

日本語訳:

ファストフード店の4種類の従業員はどのようなプロセス間通信を行っているか。またUNIXのプロセスに対応付けよ。

解答:

従業員同士は注文や商品をメッセージとして受け渡している。これはUNIXのパイプやメッセージ通信に相当する。

37:

英文:

Suppose that we have a message-passing system using mailboxes. When sending to a full mailbox or trying to receive from an empty one, a process does not block. Instead, it gets an error code back and retries. Does this scheme lead to race conditions?

日本語訳:

メールボックス方式のメッセージ通信で、満杯や空の場合にブロックせず再試行する方式は競合状態を引き起こすか。

解答:

引き起こさない。ただしビジーウェイトが発生し、CPU資源を無駄に消費する可能性がある。

38:

英文:

The CDC 6600 computers used processor sharing. If a process needed T seconds to complete in the absence of competition, how much time would it need if processor sharing was used with n processes?

日本語訳:

CDC6600のプロセッサ共有方式では、競合がなければT秒で終わるプロセスは、n個のプロセスで共有した場合何秒かかるか。

解答:

各プロセスはCPU能力の1/nしか得られないため、完了時間はおよそnT秒となる。

39:

英文:

Consider the following piece of C code:

void main() {
fork();
fork();
exit();
}
How many child processes are created upon execution of this program?

日本語訳:

次のプログラム実行時に生成される子プロセス数を求めよ。

解答:

最初のforkで1個の子プロセスが生成される。その後2つのプロセスがそれぞれforkを実行するためさらに2個生成される。合計3個の子プロセスが生成される。

40:

英文:

Round-robin schedulers normally maintain a list of all runnable processes, with each process occurring exactly once in the list. What would happen if a process occurred twice in the list? Can you think of any reason for allowing this?

日本語訳:

ラウンドロビンスケジューラでは通常、実行可能プロセスはリストに1回だけ現れる。もし同じプロセスが2回登録されていたらどうなるか。またそのようにする理由はあるか。

解答:

そのプロセスは他のプロセスより多くCPU時間を得ることになる。優先度を高く見せたい場合には意図的に利用できる。

41:

英文:

Can a measure of whether a process is likely to be CPU bound or I/O bound be determined by analyzing source code? How can this be determined at run time?

日本語訳:

プロセスがCPUバウンドかI/Oバウンドかはソースコード解析で判断できるか。また実行時にはどのように判断できるか。

解答:

ソースコードからある程度推測できるが正確には分からない。実行時にはCPU使用時間とI/O待ち時間を測定することで判断できる。

42:

英文:

Explain how time quantum value and context switching time affect each other, in a round-robin scheduling algorithm.

日本語訳:

ラウンドロビンスケジューリングにおいて、タイムクォンタムとコンテキストスイッチ時間はどのような関係にあるか説明せよ。

解答:

タイムクォンタムが短すぎるとコンテキストスイッチが頻発しオーバーヘッドが増加する。長すぎると応答性が悪化する。

43:

英文:

Measurements of a certain system have shown that the average process runs for a time T before blocking on I/O. A process switch requires a time S. For round-robin scheduling with quantum Q, give a formula for the CPU efficiency.

日本語訳:

平均してT時間実行するとI/O待ちになるプロセスがあり、プロセス切替にS時間かかる。ラウンドロビンにおけるCPU効率を求めよ。

解答:

(a) Q=∞ の場合、CPU効率は T/(T+S)

(b) Q>T の場合、CPU効率は T/(T+S)

(c) S < Q < T の場合、CPU効率は Q/(Q+S)

(d) Q=S の場合、CPU効率は 1/2

(e) Q→0 の場合、CPU効率は 0 に近づく

44:

英文:

Five jobs are waiting to be run. Their expected run times are 9, 6, 3, 5, and X. In what order should they be run to minimize average response time?

日本語訳:

実行時間が9、6、3、5、Xの5つのジョブがある。平均応答時間を最小にする実行順序を求めよ。

解答:

Shortest Job Firstを用い、実行時間の短い順に並べる。したがってXの値に応じて、3、5、6、9およびXを昇順に並べた順序が最適である。

45:

英文:

Five batch jobs A through E arrive at a computer center at almost the same time.

日本語訳:

A～Eの5つのバッチジョブがほぼ同時に到着した。各スケジューリング方式における平均ターンアラウンドタイムを求めよ。

解答:

(a) Round Robin：全ジョブがCPUを公平に共有するため平均ターンアラウンドタイムは約24分

(b) Priority Scheduling：優先度順(E,B,A,C,Dではなく B,E,A,C,D)に実行すると平均は22分

(c) FCFS：実行順10,6,2,4,8なので平均ターンアラウンドタイムは24分

(d) SJF：実行順2,4,6,8,10なので平均ターンアラウンドタイムは14分

46:

英文:

A process running on CTSS needs 30 quanta to complete. How many times must it be swapped in, including the very first time?

日本語訳:

CTSS上で動作するプロセスが完了までに30クォンタム必要とする。最初の実行も含めて何回スワップインされるか。

解答:

各クォンタムごとに再度ロードされるため、合計30回スワップインされる。

47:

英文:

Consider a real-time system with two voice calls of periodicity 5 msec each with CPU time per call of 1 msec, and one video stream of periodicity 33 ms with CPU time per call of 11 msec. Is this system schedulable?

日本語訳:

周期5ms・実行時間1msの音声処理が2本、周期33ms・実行時間11msの映像処理が1本ある。このリアルタイムシステムはスケジュール可能か。

解答:

CPU利用率は 1/5 + 1/5 + 11/33 = 0.733 である。利用率は100%未満なのでスケジュール可能である。

48:

英文:

For the above problem, can another video stream be added and have the system still be schedulable?

日本語訳:

前問のシステムにさらに映像ストリームを1本追加してもスケジュール可能か。

解答:

利用率は 1/5 + 1/5 + 11/33 + 11/33 = 1.066 となる。100%を超えるためスケジュール不可能である。

49:

英文:

The aging algorithm with α=1/2 is being used to predict run times. The previous four runs, from oldest to most recent, are 40, 20, 40, and 15 msec. What is the prediction of the next time?

日本語訳:

α=1/2の指数平均を用いるagingアルゴリズムで、過去4回の実行時間が40、20、40、15msだった。次回実行時間の予測値を求めよ。

解答:

予測値は
0.5×15 + 0.25×40 + 0.125×20 + 0.0625×40
\= 22.5ms
となる。

50:

英文:

A soft real-time system has four periodic events with periods of 50, 100, 200, and 250 msec each.

日本語訳:

周期が50ms、100ms、200ms、250msの4つの周期イベントがある。必要CPU時間が35ms、20ms、10ms、x msのとき、スケジュール可能な最大のxを求めよ。

解答:

利用率条件より
35/50 + 20/100 + 10/200 + x/250 ≤ 1

0.7 + 0.2 + 0.05 + x/250 ≤ 1

x/250 ≤ 0.05

x ≤ 12.5

したがって最大値は12.5msである。

51:

英文:

In the dining philosophers problem, let the following protocol be used:
 An even-numbered philosopher always picks up his left fork before picking up his right fork; an odd-numbered philosopher always picks up his right fork before picking up his left fork. Will this protocol guarantee deadlock-free operation?

日本語訳:

食事する哲学者問題で、偶数番号の哲学者は左のフォークを先に取り、奇数番号の哲学者は右のフォークを先に取るとする。この方式はデッドロックを防げるか。

解答:

防げる。全員が同じ順序でフォークを取得しないため、循環待ちが発生せずデッドロックを回避できる。

52:

英文:

A real-time system needs to handle two voice calls that each run every 6 msec and consume 1 msec of CPU time per burst, plus one video at 25 frames/sec, with each frame requiring 20 msec of CPU time. Is this system schedulable?

日本語訳:

周期6ms・実行時間1msの音声処理が2本と、25fpsで各フレーム20ms必要な映像処理がある。このシステムはスケジュール可能か。

解答:

利用率は 1/6 + 1/6 + 20/40 = 0.833 である。100%未満なのでスケジュール可能である。

53:

英文:

Consider a system in which it is desired to separate policy and mechanism for the scheduling of kernel threads. Propose a means of achieving this goal.

日本語訳:

カーネルスレッドのスケジューリングにおいて、方針と機構を分離したい。どのように実現できるか。

解答:

カーネルはスレッド切替機構のみ提供し、優先度やスケジューリング方針はユーザ空間または専用モジュールに任せる。

54:

英文:

In the solution to the dining philosophers problem (Fig. 2-47), why is the state variable set to HUNGRY in the procedure take forks?

日本語訳:

図2-47の哲学者問題の解法で、take forks内で状態をHUNGRYに設定するのはなぜか。

解答:

フォーク取得を希望していることを他の哲学者や監視処理へ知らせるためである。

55:

英文:

Consider the procedure put forks in Fig. 2-47. Suppose that the variable state[i] was set to THINKING after the two calls to test, rather than before. How would this change affect the solution?

日本語訳:

図2-47のput forksで、state[i]をTHINKINGにする処理をtest呼び出しの後に移したらどうなるか。

解答:

隣接する哲学者がフォークを取得できる条件が満たされず、不必要な待ちが発生する可能性がある。

56:

英文:

The readers and writers problem can be formulated in several ways. Carefully describe three different variations of the problem.

日本語訳:

読者・書き手問題には複数の定式化がある。代表的な3種類を説明せよ。

解答:

読者優先方式では読者は自由に読み込めるが書き手が飢餓状態になる可能性がある。書き手優先方式では書き手を優先するため読者が待たされる場合がある。公平方式では到着順または公平な規則に従い、どちらも飢餓状態にならない。

57:

英文:

Write a shell script that produces a file of sequential numbers...

日本語訳:

連番ファイルを生成するシェルスクリプトを作成し、競合状態を観察せよ。また競合を防ぐ方法を示せ。

解答:

複数プロセスが同時に最後の値を読み取ると同じ番号を書き込む競合状態が発生する。クリティカルセクションは読取り・加算・書込み部分である。ロックファイルを利用して排他制御することで防止できる。

58:

英文:

Assume that you have an operating system that provides semaphores. Implement a message system.

日本語訳:

セマフォを提供するOS上でメッセージ通信システムを実装せよ。

解答:

共有バッファを用意し、空き数と格納数を表すセマフォ、および排他制御用セマフォを用いて送信・受信を実装できる。

59:

英文:

Solve the dining philosophers problem using monitors instead of semaphores.

日本語訳:

セマフォではなくモニタを用いて哲学者問題を解け。

解答:

モニタ内にフォーク状態と条件変数を保持し、フォークが利用可能になるまでwaitし、解放時にsignalで通知することで実現できる。

60:

英文:

Suppose that a university wants to eliminate gender-segregated bathrooms...

日本語訳:

男女どちらかのみが同時に利用できる浴室システムについて、入室・退室処理を実装せよ。

解答:

現在利用中の性別と人数を共有変数で管理し、反対の性別が利用中の場合は待機させる。最後の利用者が退出したら待機中の利用者へ通知する。

61:

英文:

Rewrite the program of Fig. 2-23 to handle more than two processes.

日本語訳:

図2-23のプログラムを、2プロセスではなく複数プロセスに対応するよう書き換えよ。

解答:

turn変数だけでは複数プロセスを扱えないため、Bakeryアルゴリズムなど複数プロセス向けの相互排他アルゴリズムを利用する。

62:

英文:

Write a producer-consumer problem that uses threads and shares a common buffer. However, do not use semaphores or any other synchronization primitives...

日本語訳:

スレッドを用いた生産者・消費者問題を作成せよ。ただしセマフォなどの同期機構は使用しない。

解答:

同期機構を使用しない場合、共有バッファの更新中に競合状態が発生し、データ消失や不整合が起こる。実行を続けると高い確率で致命的な競合状態が発生する。

63:

英文:

A process can be put into a round-robin queue more than once to give it a higher priority...

日本語訳:

同じプログラムを複数起動してCPU時間を多く獲得できるか調べよ。

解答:

複数インスタンスを起動するとスケジューラ上でより多くの実行機会を得られる場合がある。その結果、他のプロセスが存在する環境では処理速度が向上する可能性がある。

64:

英文:

The objective of this exercise is to implement a multithreaded solution to find if a given number is a perfect number.

日本語訳:

与えられた数が完全数かどうかをマルチスレッドで判定するプログラムを実装せよ。

解答:

1からNまでの範囲を複数スレッドへ分割し、それぞれが約数を探索する。見つかった約数は共有領域へ排他的に追加し、全スレッド終了後に合計値がNと一致するか判定する。

65:

英文:

Implement a program to count the frequency of words in a text file.

日本語訳:

テキストファイル内の単語出現頻度を数えるプログラムを実装せよ。

解答:

ファイルを複数区間へ分割し、それぞれを別スレッドで処理する。各スレッドが単語頻度表を作成し、最後にメインスレッドが結果を統合して全体の出現頻度を求める。

#pagebreak()

= Memory managements

1:

英文:

The IBM 360 had a scheme of locking 2-KB blocks by assigning each one a 4-bit key and having the CPU compare the key on every memory reference to the 4-bit key in the PSW. Name two drawbacks of this scheme not mentioned in the text.

日本語訳:

IBM 360では2KBブロックごとに4ビットのキーを割り当て、CPUが各メモリアクセス時にPSW内のキーと比較していた。この方式の欠点を2つ挙げよ。

解答:

キーが4ビットしかないため保護の種類が少ない。また、アクセスのたびに比較処理が必要となりハードウェアが複雑になる。

2:

英文:

In Fig. 3-3 the base and limit registers contain the same value, 16,384. Is this just an accident, or are they always the same? If it is just an accident, why are they the same in this example?

日本語訳:

図3-3ではベースレジスタとリミットレジスタがどちらも16384になっている。これは偶然か、それとも常に同じなのか。

解答:

偶然である。この例ではプロセスの開始位置とサイズがたまたま同じ値になっているだけで、一般には異なる。

3:

英文:

A swapping system eliminates holes by compaction... about how long does it take to compact 4 GB?

日本語訳:

スワッピングシステムがコンパクションによって4GBのメモリを整理するとき、どの程度時間がかかるか。

解答:

4GBは約2^30ワードである。各ワードの読込みと書込みで8ns必要なので、
2^30 × 8ns ≒ 8.6秒
となる。

4:

英文:

Consider a swapping system in which memory consists of the following hole sizes...

日本語訳:

ホールサイズが10,4,20,18,7,9,12,15MBである。12MB、10MB、9MB要求に対し各方式でどのホールが選ばれるか。

解答:

First Fit:

12→20MB, 10→10MB, 9→18MB

Best Fit:

12→12MB, 10→10MB, 9→9MB

Worst Fit:

12→20MB, 10→18MB, 9→15MB

Next Fit:

前回位置から探索するため結果は状況依存だが、最初はFirst Fitと同じになる。

5:

英文:

What is the difference between a physical address and a virtual address?

日本語訳:

物理アドレスと仮想アドレスの違いは何か。

解答:

物理アドレスは実メモリ上の位置であり、仮想アドレスはプロセスが利用する論理的なアドレスである。

6:

英文:

For each of the following decimal virtual addresses, compute the virtual page number and offset...

日本語訳:

次の仮想アドレスについてページ番号とオフセットを求めよ。

解答:

4KBページ

20000 → ページ4, オフセット3616

32768 → ページ8, オフセット0

60000 → ページ14, オフセット2656

8KBページ

20000 → ページ2, オフセット3616

32768 → ページ4, オフセット0

60000 → ページ7, オフセット2656

7:

英文:

Using the page table of Fig. 3-9, give the physical address...

日本語訳:

図3-9のページテーブルを用いて物理アドレスを求めよ。

解答:

図3-9のページテーブル情報が必要なため解答不能。

8:

英文:

The Intel 8086 processor did not have an MMU...

日本語訳:

MMUを持たない8086でページングを実現した方法を推測せよ。

解答:

CPUとメモリの間に外付けのアドレス変換ハードウェアを配置して実現したと考えられる。

9:

英文:

What kind of hardware support is needed for a paged virtual memory to work?

日本語訳:

ページング仮想記憶を実現するために必要なハードウェア支援は何か。

解答:

MMU、ページテーブル参照機構、TLB、およびページフォールト例外機構が必要である。

10:

英文:

Copy on write is an interesting idea used on server systems. Does it make any sense on a smartphone?

日本語訳:

Copy on Writeはスマートフォンでも有効か。

解答:

有効である。メモリ容量や消費電力を節約できるため、スマートフォンでも利用価値がある。

11:

英文:

Consider the following C program...

日本語訳:

TLBミスが毎回発生するMとNの条件を求めよ。

解答:

(a)
各アクセスが異なるページに対応し、かつ64ページを超える場合である。例えば M=1024、N>65536。

(b)
ループを繰り返してもTLB容量を超えるページ数を巡回するため、依然として頻繁にTLBミスが発生する。

12:

英文:

The amount of disk space that must be available for page storage is related to the maximum number of processes, n, the number of bytes in the virtual address space, v, and the number of bytes of RAM, r.

日本語訳:

ページ保存用に必要なディスク容量は、最大プロセス数n、仮想アドレス空間サイズv、RAM容量rと関係する。最悪時の必要容量を求めよ。

解答:

最悪の場合、全プロセスの仮想メモリからRAM分を除いた領域がディスクに必要となるため、

nv − r

バイトである。

13:

英文:

If an instruction takes 1 nsec and a page fault takes an additional n nsec, give a formula for the effective instruction time if page faults occur every k instructions.

日本語訳:

命令実行に1nsかかり、ページフォールト時には追加でn nsかかる。k命令ごとにページフォールトが発生する場合の実効命令時間を求めよ。

解答:

平均実行時間は

1 + n/k

ns

となる。

14:

英文:

A machine has a 32-bit address space and an 8-KB page...

日本語訳:

32ビットアドレス空間、8KBページのシステムで、ページテーブル読込みにCPU時間の何割が使われるか求めよ。

解答:

ページ数は

2^32 / 2^13 = 2^19 = 524288

エントリ

ロード時間は

524288 × 100ns = 52.4ms

全実行時間100msなので

52.4%

である。

15:

英文:

Suppose that a machine has 48-bit virtual addresses and 32-bit physical addresses.

日本語訳:

48ビット仮想アドレス、32ビット物理アドレスのシステムについて答えよ。

解答:

(a)

ページサイズ4KBならオフセットは12ビット。

ページ数は

2^(48−12)=2^36

なのでページテーブルは約687億エントリ必要となる。

(b)

配列アクセスが多数のページにまたがるため、TLBエントリ32個では追いつかず、TLBヒット率は低くなる。

16:

英文:

You are given the following data about a virtual memory system...

日本語訳:

TLBヒット率99%、ページフォールト率0.01%のとき、実効アドレス変換時間を求めよ。

解答:

平均時間は

0.99×1
+0.0099×101
+0.0001×6000101

≒ 601.99ns

となる。

17:

英文:

Suppose that a machine has 38-bit virtual addresses and 32-bit physical addresses.

日本語訳:

38ビット仮想アドレス、32ビット物理アドレスのシステムについて答えよ。

解答:

(a)

多段ページテーブルでは実際に使用される部分だけ確保すればよく、メモリ消費を削減できる。

(b)

ページサイズ16KBなのでオフセットは14ビット。

残り24ビットを2段で分割する。

各エントリ4バイトなので1ページに4096エントリ格納できるため、

下位12ビット、上位12ビット

に分割する。

18:

英文:

Section 3.3.4 states that the Pentium Pro extended each entry in the page table hierarchy to 64 bits but still could only address 4 GB of memory.

日本語訳:

Pentium Proはページテーブルエントリを64ビット化したのに、なぜ4GBしかアドレス指定できなかったのか。

解答:

仮想アドレス自体が32ビットのままだったため、ページテーブルが64ビットでもアドレス空間は4GBに制限されていた。

19:

英文:

A computer with a 32-bit address uses a two-level page table...

日本語訳:

32ビットアドレス空間で上位9ビット、次段11ビットをページ番号に使う場合、ページサイズとページ数を求めよ。

解答:

オフセットは

32−9−11=12ビット

なのでページサイズは

2^12=4096バイト

ページ数は

2^(9+11)=2^20=1048576

ページである。

20:

英文:

A computer has 32-bit virtual addresses and 4-KB pages...

日本語訳:

プログラムとデータは最下位ページ、スタックは最上位ページのみ使用する場合、必要なページテーブルエントリ数を求めよ。

解答:

1段ページテーブルでは

2^20 = 1048576

エントリ必要。

2段ページテーブルでは

トップレベル1エントリ
下位ページテーブル2個

合計

1 + 1024 + 1024 = 2049

エントリ必要。

21:

英文:

Below is an execution trace of a program fragment...

日本語訳:

与えられた命令列からページ参照列を求めよ。

解答:

ページサイズは512バイト。

1020 → ページ1

6144 → ページ12

8192 → ページ16

5120 → ページ10

したがって参照列は

1,12,16,10,16,10

となる。

22:

英文:

A computer whose processes have 1024 pages in their address spaces...

日本語訳:

平均オーバーヘッドを2nsにするために必要なTLBヒット率を求めよ。

解答:

ヒット率をhとすると

h×1 + (1−h)×5 = 2

より

h = 0.75

したがって

75%

以上のヒット率が必要である。

23:

英文:

How can the associative memory device needed for a TLB be implemented in hardware, and what are the implications of such a design for expandability?

日本語訳:

TLBに必要な連想メモリはどのようにハードウェア実装できるか。また、その設計は拡張性にどのような影響を与えるか。

解答:

CAM（Content Addressable Memory）を用いて並列検索を行う。高速だが回路規模や消費電力が大きくなり、大容量化しにくい。

24:

英文:

A machine has 48-bit virtual addresses and 32-bit physical addresses. Pages are 8 KB. How many entries are needed for a single-level linear page table?

日本語訳:

48ビット仮想アドレス、8KBページの場合、1段ページテーブルには何エントリ必要か。

解答:

オフセットは13ビットなので、

2^(48−13) = 2^35

エントリ必要である。

25:

英文:

A computer with an 8-KB page, a 256-KB main memory, and a 64-GB virtual address space uses an inverted page table...

日本語訳:

逆ページテーブルを用いるシステムで、平均ハッシュチェーン長を1未満にするためのハッシュ表サイズを求めよ。

解答:

主記憶フレーム数は

256KB ÷ 8KB = 32

フレーム。

平均長を1未満にするには32より大きい2のべき乗が必要なので、

64エントリ

のハッシュ表を用いる。

26:

英文:

A student proposes writing a compiler that produces a list of page references for the optimal page replacement algorithm.

日本語訳:

最適ページ置換アルゴリズム用のページ参照列をコンパイラが生成することは可能か。

解答:

一般には不可能である。実行時の入力や分岐によって参照ページが変化するためである。ただし局所性を考慮したコード生成で性能改善は可能である。

27:

英文:

Suppose that the virtual page reference stream contains repetitions of long sequences of page references...

日本語訳:

長いページ参照列が繰り返される場合について答えよ。

解答:

(a)

割当フレーム数が系列長より少ないと、LRUやFIFOなどは系列の先頭ページを追い出してしまい、繰り返し時に大量のページフォールトが発生する。

(b)

500フレームで系列長512の場合、繰り返しパターンを学習し、頻繁に使われる512ページを優先保持する予測型アルゴリズムが有効である。

28:

英文:

If FIFO page replacement is used with four page frames and eight pages...

日本語訳:

FIFOおよびLRUでページフォールト数を求めよ。参照列は0172327103。

解答:

FIFO:


0,1,7,2で4回フォールト。
3で5回目。
2はヒット。
7はヒット。
1はヒット。
0で6回目。
3はヒット。

合計6回。

LRU:


0,1,7,2で4回。
3で5回。
2はヒット。
7はヒット。
1で6回。
0で7回。
3で8回。

合計8回。

29:

英文:

Consider the page sequence of Fig. 3-15(b)...

日本語訳:

図3-15(b)のページ列で、Rビットが11011011の場合、Second Chanceはどのページを置換するか。

解答:

Second Chanceは最初に見つかったR=0のページを選ぶ。与えられた並びでは最初の0に対応するページが置換対象となる。

30:

英文:

A small computer on a smart card has four page frames...

日本語訳:

Agingアルゴリズムで8ビットカウンタを用いた場合、最後のクロック後のカウンタ値を求めよ。

解答:

各クロックで右シフトし、Rビットを最上位へ挿入すると、

ページ0 = 10110100₂ = 180

ページ1 = 01101010₂ = 106

ページ2 = 11010100₂ = 212

ページ3 = 11101001₂ = 233

となる。

31:

英文:

Give a simple example of a page reference sequence where the first page selected for replacement will be different for the clock and LRU page replacement algorithms.

日本語訳:

Clock法とLRU法で最初に置換されるページが異なる参照列の例を示せ。

解答:

フレーム数3、参照列

0,1,2,0,1,3

を考える。

LRUではページ2が最も古いため置換される。

Clockでは針位置とRビットの状態によって0または1が選ばれる可能性があり、結果が異なる。

32:

英文:

In the WSClock algorithm of Fig. 3-20(c), the hand points to a page with R=0. If τ=400, will this page be removed? What about if τ=1000?

日本語訳:

WSClockで針がR=0のページを指している。τ=400およびτ=1000の場合、このページは置換されるか。

解答:

ページの経過時間が400を超えていればτ=400では置換される。τ=1000では経過時間が1000を超えない限り置換されない。

33:

英文:

Suppose that the WSClock page replacement algorithm uses a τ of two ticks...

日本語訳:

WSClockでτ=2の場合、与えられた表についてクロック割込み時とページフォールト時の状態を求めよ。

解答:

(a)

クロック割込みではRビットが0へクリアされる。

変更:

ページ1 R=0
ページ2 R=0

(b)

ページフォールト時にはページ4が候補となる。無効ページなので新しいページを読み込み、V=1となる。置換対象はWSClock規則に従って選択される。

34:

英文:

A student has claimed that “in the abstract, the basic page replacement algorithms (FIFO, LRU, optimal) are identical except for the attribute used for selecting the page to be replaced.”

日本語訳:

FIFO、LRU、Optimalは、置換対象ページを選ぶ属性が異なるだけで本質的には同じであるという主張について答えよ。

解答:

(a)

FIFO:
 メモリに入った時刻

LRU:
 最後に参照された時刻

Optimal:
 次回参照までの時間

を属性として用いる。

(b)

共通アルゴリズムは「全ページから評価値を計算し、最も不適切なページを選んで置換する」である。評価値の定義だけが異なる。

35:

英文:

How long does it take to load a 64-KB program from a disk...

日本語訳:

64KBプログラムをディスクから読み込む時間を求めよ。

解答:

1ページごとに

シーク5ms + 回転待ち5ms = 10ms

必要。

(a)

2KBページの場合

64KB ÷ 2KB = 32ページ

32 × 10ms = 320ms

転送時間は無視できるので約320ms。

(b)

4KBページの場合

64KB ÷ 4KB = 16ページ

16 × 10ms = 160ms

36:

英文:

A computer has four page frames...

日本語訳:

与えられたページ情報について各置換方式でどのページが選ばれるか。

解答:

(a) NRU

クラス0(R=0,M=0)のページ2

(b) FIFO

最も古くロードされたページ3

(c) LRU

最終参照時刻が最も古いページ1

(d) Second Chance

FIFO順で調べる。

ページ3はR=1なので猶予。

次のページ0もR=1。

ページ2はR=0なので置換。

よってページ2。

37:

英文:

Suppose that two processes A and B share a page that is not in memory...

日本語訳:

共有ページでAがページフォールトを起こした場合について答えよ。

解答:

(a)

Bがまだそのページを参照しない場合は更新を遅延できる。

(b)

後でBがアクセスした際に追加のページテーブル更新処理が必要になる。

38:

英文:

Consider the following two-dimensional array...

日本語訳:

2次元配列Xに対する2つのコード断片について、どちらがページフォールト数を少なくするか求めよ。

解答:

配列は64×64=4096要素。

1ページは128要素なので配列全体で32ページ。

Fragment Aは列方向アクセスで局所性が悪い。

ほぼ毎回ページ切替が発生する。

Fragment Bは行方向アクセスで連続アクセスになる。

各ページにつき1回程度のフォールトで済む。

したがってFragment Bの方が圧倒的に少ない。

総ページフォールト数:


Fragment B ≒ 32回

Fragment A ≒ 2048回

39:

英文:

A cloud computing company is considering handling page faults by reading pages from another server's RAM.

日本語訳:

他サーバのRAMからページを取得してページフォールトを処理する方法について答えよ。

解答:

(a)

高速ネットワーク経由でリモートメモリを参照する。

(b)

ネットワーク遅延がディスクアクセス時間より十分小さい場合に有効である。高速データセンターネットワークが必要となる。

40:

英文:

One of the first timesharing machines, the DEC PDP-1...

日本語訳:

PDP-1のページングドラムが任意位置から読書きできた理由を説明せよ。

解答:

回転待ち時間を削減するためである。任意位置から開始できれば、最短時間でプロセス全体を書き込める。

41:

英文:

A computer provides each process with 65,536 bytes of address space...

日本語訳:

与えられたプログラムはアドレス空間に収まるか。

解答:

4096バイトページ:


テキスト 32768 → 8ページ

データ 16386 → 5ページ

スタック 15870 → 4ページ

合計17ページ必要。

利用可能は16ページなので収まらない。

512バイトページ:


テキスト 64ページ

データ 33ページ

スタック 31ページ

合計128ページ。

利用可能も128ページなので収まる。

42:

英文:

It has been observed that the number of instructions executed between page faults...

日本語訳:

メモリ容量を2倍にした場合の実行時間を求めよ。

解答:

元の実行時間60秒。

ページフォールト数15000回。

1回につき追加2000μs=0.002秒。

フォールト時間:


15000 × 0.002 = 30秒

通常実行時間:


60 − 30 = 30秒

メモリ2倍でフォールト半減。

7500回 → 15秒

新実行時間:


30 + 15 = 45秒

43:

英文:

The Frugal Computer Company proposes not saving program text in swap space.

日本語訳:

プログラムテキストをスワップへ保存せず実行ファイルから直接読み込む案について答えよ。

解答:

テキスト領域は通常読み取り専用なので実行ファイルから再読込み可能である。一方、データ領域は実行中に変更されるため、そのままでは利用できない。

44:

英文:

A machine-language instruction to load a 32-bit word into a register contains the 32-bit address of the word to be loaded.

日本語訳:

32ビットアドレスを含むロード命令は最大何回のページフォールトを起こすか。

解答:

命令自身のページが不在なら1回、参照データのページが不在ならさらに1回。

したがって最大2回である。

45:

英文:

Explain the difference between internal fragmentation and external fragmentation.

日本語訳:

内部断片化と外部断片化の違いを説明せよ。

解答:

内部断片化は割り当て領域内の未使用部分による無駄である。外部断片化は空き領域が分散し、大きな連続領域を確保できなくなる現象である。ページングでは内部断片化が発生し、純粋なセグメンテーションでは外部断片化が発生する。

46:

英文:

When segmentation and paging are both being used, as in MULTICS...

日本語訳:

セグメンテーションとページングを併用する場合、TLBも二段階参照を行うのか。

解答:

通常は行わない。TLBには最終的なアドレス変換結果が格納されるため、一度の参照で変換できる。

47:

英文:

For each of the following cases, either give the real memory address...

日本語訳:

各アクセスについて物理アドレスまたは発生するフォールトを答えよ。

解答:

(a)

segment1 page1 offset3

ページフレーム14

14×1024+3 = 14339

(b)

segment0はRead/Executeのみ。

書込みなので保護違反。

Protection Fault

(c)

segment1 page4はOn Disk

Page Fault

(d)

segment1は実行権限なし。

Protection Fault

48:

英文:

Can you think of any situations where supporting virtual memory would be a bad idea?

日本語訳:

仮想メモリをサポートしない方がよい状況はあるか。

解答:

リアルタイムシステムではページフォールトによる遅延が問題となるため、仮想メモリを使わない方が望ましい場合がある。

49:

英文:

Virtual memory provides a mechanism for isolating one process from another.

日本語訳:

2つのOSを同時実行する場合、どのようなメモリ管理上の問題があるか。

解答:

ページテーブルや物理メモリの競合が発生する。ハイパーバイザを用いて各OSに独立した仮想アドレス空間を与えることで解決できる。

50:

英文:

Plot a histogram and calculate the mean and median...

日本語訳:

実行ファイルサイズのヒストグラムを作成し、最適ページサイズを求めよ。

解答:

実際の環境依存問題である。一般には内部断片化とページテーブルサイズのバランスから4KB～16KB程度が適切となる。

51:

英文:

Write a program that simulates a paging system using the aging algorithm.

日本語訳:

Agingアルゴリズムをシミュレートするプログラムを作成せよ。

解答:

ページ参照列を入力し、各ページにカウンタを持たせてAgingアルゴリズムを実装する。ページ数ごとのページフォールト率を測定してグラフ化する。

52:

英文:

Write a program that simulates a toy paging system that uses the WSClock algorithm.

日本語訳:

WSClockアルゴリズムを用いたページングシステムをシミュレートせよ。

解答:

ページテーブル、時計針、タイムスタンプを管理する。ページ参照列に対してWSClockを適用し、ページフォールト数やワーキングセットサイズを記録する。

53:

英文:

Write a program that demonstrates the effect of TLB misses...

日本語訳:

TLBミスがアクセス時間に与える影響を測定するプログラムを作成せよ。

解答:

大きな配列を異なるストライド幅で走査し、アクセス時間を計測する。ページサイズ付近でTLBミスが増加し、アクセス時間が上昇することを確認できる。

54:

英文:

Write a program that will demonstrate the difference between using a local page replacement policy and a global one...

日本語訳:

ローカル置換とグローバル置換の違いを示すプログラムを作成せよ。

解答:

2プロセスの独立した参照列を生成し、両方式でページフォールト率を比較する。グローバル方式では一方のプロセスが他方のフレームを奪う様子を観察できる。

55:

英文:

Write a program that can be used to compare the effectiveness of adding a tag field to TLB entries...

日本語訳:

TLBタグ機能の効果を比較するプログラムを作成せよ。

解答:

プロセスID付きTLBとタグなしTLBをシミュレートし、コンテキストスイッチ時のTLB更新回数を比較する。タグ付きの方が更新回数を大幅に削減できる。

#pagebreak()

= File systems

1:

英文:

Give five different path names for the file /etc/passwd.

日本語訳:

ファイル /etc/passwd を表す異なるパス名を5つ挙げよ。

解答:

/etc/passwd
/etc/./passwd
/./etc/passwd
/etc/../etc/passwd
/../etc/passwd

2:

英文:

In Windows, when a user double clicks on a file listed by Windows Explorer...

日本語訳:

Windowsでファイルをダブルクリックしたとき、OSはどのプログラムを起動するかどのように判断するか。

解答:

拡張子とアプリケーションの関連付けを参照する方法と、ファイル内容やヘッダ情報を調べる方法がある。

3:

英文:

In early UNIX systems, executable files (a.out files) began with a very specific magic number...

日本語訳:

なぜ実行ファイルのマジックナンバーは特別な値だったのか。

解答:

誤って実行ファイルを実行不能なファイルと判定しないように、特別な意味を持つ値が選ばれたためである。

4:

英文:

Is the open system call in UNIX absolutely essential?

日本語訳:

UNIXのopenシステムコールは絶対に必要か。

解答:

必須ではないが、毎回ファイル名検索が必要になり性能が大きく低下する。

5:

英文:

Systems that support sequential files always have an operation to rewind files.

日本語訳:

ランダムアクセス可能なファイルシステムでもrewindは必要か。

解答:

不要である。ランダムアクセス機能があれば先頭位置へ直接移動できる。

6:

英文:

Some operating systems provide a system call rename...

日本語訳:

renameとコピー後削除は同じか。

解答:

異なる。renameは通常ディレクトリエントリ変更のみで高速だが、コピー後削除はデータ全体を複製する必要がある。

7:

英文:

In some systems it is possible to map part of a file into memory.

日本語訳:

ファイルの一部だけをメモリマップする場合の制約は何か。

解答:

ページ境界に合わせる必要がある。必要なページのみ仮想アドレス空間へ割り当てることで実現する。

8:

英文:

A simple operating system supports only a single directory...

日本語訳:

単一ディレクトリしかないOSで階層構造を模倣できるか。

解答:

可能である。ファイル名に「dir_subdir_file」のような規則を設けて疑似的な階層を表現できる。

9:

英文:

Propose an alternative way to do random access without having this system call.

日本語訳:

現在位置変更システムコールを使わずにランダムアクセスを行う方法を提案せよ。

解答:

readやwriteにオフセットを引数として渡す方式を採用する。

10:

英文:

Consider the directory tree of Fig. 4-8...

日本語訳:

/usr/jim が作業ディレクトリのとき、../ast/x の絶対パス名は何か。

解答:

/usr/ast/x

11:

英文:

Contiguous allocation of files leads to disk fragmentation...

日本語訳:

連続割り当てで最後のブロックに生じる無駄は内部断片化か外部断片化か。

解答:

内部断片化である。ページングにおける最後のページの未使用領域と同様である。

12:

英文:

Describe the effects of a corrupted data block...

日本語訳:

データブロック破損時の影響を説明せよ。

解答:

(a) Contiguous:

そのブロックのデータのみ失われる。

(b) Linked:

後続ブロックへのリンクも失われ、以降のデータが参照できなくなる。

(c) Indexed:

データブロック破損ならその部分のみ失われる。インデックス破損なら多数のブロックへ影響する。

13:

英文:

One way to use contiguous allocation of the disk and not suffer from holes is to compact the disk every time a file is removed.

日本語訳:

ファイル削除のたびにディスクコンパクションを行う場合の所要時間を求めよ。

解答:

8KBファイルの読込みと書込み時間は、

5ms + 4ms + (8KB / 80MB/s)
+
5ms + 4ms + (8KB / 80MB/s)

≒ 18.2ms

16GBディスクの半分は8GB。

8GB ÷ 8KB = 約104万ファイル

したがって

約18.2ms × 104万 ≒ 5.3時間

となる。

14:

英文:

In light of the answer to the previous question, does compacting the disk ever make any sense?

日本語訳:

前問の結果を踏まえ、ディスクコンパクションは意味があるか。

解答:

頻繁には意味がない。非常に時間がかかるため、特別な保守作業としてのみ実施するのが現実的である。

15:

英文:

Name a modern device that requires file storage and for which contiguous allocation would be a fine idea.

日本語訳:

連続割り当てが適している現代の機器を挙げよ。

解答:

デジタルビデオレコーダや監視カメラレコーダが適している。

16:

英文:

Consider the i-node shown in Fig. 4-13...

日本語訳:

i-nodeが10個の直接アドレスを持つ場合、最大ファイルサイズを求めよ。

解答:

ブロックサイズは1024KB。

直接ブロック:

10 × 1024KB = 10MB

間接ブロック:

1024KB ÷ 8B = 131072個のアドレス

131072 × 1024KB = 128GB

合計約128GBである。

17:

英文:

For a given class, the student records are stored in a file...

日本語訳:

固定長レコードをランダムアクセス・更新する場合、どの割り当て方式が適切か。

解答:

連続割り当てが最も適している。

18:

英文:

Consider a file whose size varies between 4 KB and 4 MB during its lifetime.

日本語訳:

サイズが頻繁に変化するファイルにはどの方式が適切か。

解答:

インデックス方式が最も適している。

19:

英文:

It has been suggested that efficiency could be improved...

日本語訳:

短いファイルをi-node内に保存する場合、何バイト格納できるか。

解答:

10個の直接ポインタをデータ領域として利用すると、

10 × 4B = 40バイト

格納できる。

20:

英文:

Two computer science students, Carolyn and Elinor, are having a discussion about i-nodes.

日本語訳:

毎回新しいi-nodeを読み込むべきか、それとも既存のi-node表を検索すべきか。

解答:

Elinorが正しい。既に存在するi-nodeを再利用した方がメモリ使用量もディスクアクセスも削減できる。

21:

英文:

Name one advantage of hard links over symbolic links and one advantage of symbolic links over hard links.

日本語訳:

ハードリンクとシンボリックリンクの利点を1つずつ挙げよ。

解答:

ハードリンクは元ファイル削除後も利用できる。
シンボリックリンクは別ファイルシステムへのリンクを作成できる。

22:

英文:

Explain how hard links and soft links differ with respect to i-node allocations.

日本語訳:

ハードリンクとソフトリンクのi-node利用方法の違いを説明せよ。

解答:

ハードリンクは同じi-nodeを共有する。ソフトリンクは新しいi-nodeを持ち、パス名を保存する。

23:

英文:

Consider a 4-TB disk that uses 4-KB blocks and the free-list method.

日本語訳:

1ブロックに何個のブロックアドレスを格納できるか。

解答:

4TBディスクでは約2^30ブロック存在するのでアドレスは30ビット必要。

4KB = 32768ビット。

32768 ÷ 30 ≒ 1092

個格納できる。

24:

英文:

Free disk space can be kept track of using a free list or a bitmap.

日本語訳:

フリーリストがビットマップより小さくなる条件を求めよ。

解答:

フリーリスト:


F × D

ビット

ビットマップ:


B

ビット

したがって

FD < B

のときフリーリストが有利。

D=16なら

F/B < 1/16

つまり

空き領域が6.25%未満

のときフリーリストの方が小さい。

25:

英文:

The beginning of a free-space bitmap looks like this after the disk partition is first formatted.

日本語訳:

各操作後のビットマップを示せ。

解答:


初期状態
1000 0000 0000 0000

A作成(6ブロック使用)
1111 1110 0000 0000

(a) B作成(5ブロック使用)
1111 1111 1110 0000

(b) A削除
1000 0001 1110 0000

(c) C作成(8ブロック使用)
1111 1111 1110 0000

(d) B削除
1111 1110 0000 0000

26:

英文:

What would happen if the bitmap or free list containing the information about free disk blocks was completely lost due to a crash?

日本語訳:

空き領域管理情報が失われた場合どうなるか。

解答:

空きブロック情報が失われるためファイルシステムは不整合になる。ただしUNIXではfsck、FATではscandiskやchkdskによって再構築できる場合がある。

27:

英文:

Oliver Owl’s night job at the university computing center is to change the tapes used for overnight data backups.

日本語訳:

バックアップ中に同じシステムで文書編集を行うことに問題はあるか。

解答:

ある。バックアップ中にファイル内容が変更されると、一貫性のないバックアップが作成される可能性がある。

28:

英文:

In Windows it is easy to tell when to dump a file because every file has an archive bit. This bit is missing in UNIX.

日本語訳:

UNIXではどのようにバックアップ対象を判断するか。

解答:

ファイルの更新日時（mtime）を利用し、前回バックアップ以降に変更されたファイルを判定する。

29:

英文:

Suppose that file 21 in Fig. 4-25 was not modified since the last dump.

日本語訳:

ファイル21が変更されていなかった場合、4つのビットマップはどう変化するか。

解答:

ファイル21に対応するビットのみが0になり、それ以外は変化しない。

30:

英文:

It has been suggested that the first part of each UNIX file be kept in the same disk block as its i-node.

日本語訳:

これにはどのような利点があるか。

解答:

小さなファイルを読む際にi-nodeとデータを同時に取得できるため、ディスクアクセス回数を減らせる。

31:

英文:

Consider Fig. 4-27. Is it possible that for some particular block number the counters in both lists have the value 2?

日本語訳:

両方のリストで同じブロック番号のカウンタが2になることはあるか。

解答:

正常な状態では起こらない。発生した場合は参照カウントの不整合であり、ファイルシステム検査ツールで修正する必要がある。

32:

英文:

The performance of a file system depends upon the cache hit rate.

日本語訳:

平均アクセス時間の式を求めよ。

解答:

平均時間Tは

T = h × 1 + (1 - h) × 40

\= 40 - 39h [ms]

である。

h=0なら40ms、
h=1なら1msとなる。

33:

英文:

For an external USB hard drive attached to a computer, which is more suitable:
 a write-through cache or a block cache?

日本語訳:

USB外付けディスクにはどちらが適切か。

解答:

安全性を重視するならwrite-through cacheが適している。突然取り外されてもデータ損失が起きにくい。

34:

英文:

Would the "block read-ahead" technique be useful here?

日本語訳:

学生レコードのランダムアクセス処理で先読みは有効か。

解答:

ほとんど有効ではない。アクセスがランダムで連続性がないためである。

35:

英文:

Given the FAT table entries as below, what are the data blocks allotted to f1 and f2?

日本語訳:

f1とf2が使用するデータブロック列を求めよ。

解答:


f1開始ブロック22

22 → 19 → 15 → 17 → 21 → EOF

したがって

f1 = 22,19,15,17,21

f2開始ブロック16

16 → 23 → 14 → 18 → 20 → EOF

したがって

f2 = 16,23,14,18,20

36:

英文:

Consider the idea behind Fig. 4-21...

日本語訳:

ブロックサイズ1KB、2KB、4KBのデータ転送速度を求めよ。

解答:


回転速度
15000rpm = 250回転/秒

1回転時間
4ms

1トラック = 1048576B

転送速度

1048576 ÷ 0.004

≒ 262MB/s

ブロックサイズごとの平均時間

1KB:

6ms + 2ms + (1KB / 262MB/s)
≒ 8.004ms

速度 ≒ 0.125MB/s

2KB:

6ms + 2ms + (2KB / 262MB/s)
≒ 8.008ms

速度 ≒ 0.25MB/s

4KB:

6ms + 2ms + (4KB / 262MB/s)
≒ 8.016ms

速度 ≒ 0.50MB/s

37:

英文:

A certain file system uses 4-KB disk blocks. The median file size is 1 KB.

日本語訳:

全ファイルが1KBなら無駄になるディスク容量の割合はいくらか。また実際のファイルシステムではどうなるか。

解答:

1KBのファイルに4KBブロックを割り当てるため、

無駄 = 3KB

割合 = 3/4 = 75%

実際は大きなファイルも存在するため、無駄割合は一般に75%より小さくなる。

38:

英文:

Given a disk-block size of 4 KB and block-pointer address value of 4 bytes...

日本語訳:

10個の直接アドレスと1個の間接ブロックでアクセス可能な最大ファイルサイズを求めよ。

解答:

1ブロックに格納できるポインタ数は

4096 ÷ 4 = 1024

直接ブロック

10 × 4096 = 40960B

間接ブロック

1024 × 4096 = 4194304B

合計

4235264B

約4.04MBである。

39:

英文:

Files in MS-DOS have to compete for space in the FAT-16 table in memory.

日本語訳:

1ファイルがk個のFATエントリを使用する場合、全ファイル長にどのような制約があるか。

解答:

FAT-16は最大65536エントリしか持たないため、全ファイルで使用するクラスタ数の合計は65536以下でなければならない。

40:

英文:

A UNIX file system has 4-KB blocks and 4-byte disk addresses.

日本語訳:

10直接、1単一、1二重、1三重間接を持つ場合の最大ファイルサイズを求めよ。

解答:

1ブロックのポインタ数

4096 ÷ 4 = 1024

データブロック数

10

- 1024
- 1024²
- 1024³

\= 1,074,791,434

最大サイズ

1,074,791,434 × 4096

≈ 4.4TB

41:

英文:

How many disk operations are needed to fetch the i-node for a file with the path name /usr/ast/courses/os/handout.t?

日本語訳:

対象ファイルのi-node取得に必要なディスクアクセス回数を求めよ。

解答:

ルートi-nodeはメモリ上にある。

必要なのは

usrディレクトリ読込み
usrのi-node読込み
astディレクトリ読込み
astのi-node読込み
coursesディレクトリ読込み
coursesのi-node読込み
osディレクトリ読込み
osのi-node読込み
handout.tのi-node読込み

合計9回である。

42:

英文:

In many UNIX systems, the i-nodes are kept at the start of the disk.

日本語訳:

i-nodeをファイル先頭付近に配置する方式の利点と欠点を述べよ。

解答:

利点はi-nodeとデータを近接配置できるためアクセスが速いことである。欠点はi-node管理が複雑になり、断片化が増えることである。

43:

英文:

Write a program that reverses the bytes of a file.

日本語訳:

ファイルのバイト順を逆転するプログラムを書け。

解答:

ファイルの先頭と末尾から順に読み込み、内容を交換しながら中央へ進めば実装できる。

44:

英文:

Write a program that starts at a given directory and descends the file tree.

日本語訳:

ディレクトリ以下の全ファイルサイズのヒストグラムを作成するプログラムを書け。

解答:

再帰的にディレクトリを探索し、各ファイルサイズを取得して指定ビン幅ごとに集計し、最後にヒストグラムを出力する。

45:

英文:

Write a program that scans all directories in a UNIX file system.

日本語訳:

ハードリンク数が2以上のi-nodeを検出するプログラムを書け。

解答:

全ディレクトリを走査し、同じi-node番号を持つファイル名を収集して一覧表示する。

46:

英文:

Write a new version of the UNIX ls program.

日本語訳:

簡易版lsプログラムを書け。

解答:

指定ディレクトリを走査し、各ファイルについて名前、サイズ、属性、最初のブロック番号などを1行ずつ表示する。

47:

英文:

Implement a program to measure the impact of application-level buffer sizes on read time.

日本語訳:

バッファサイズが読み書き性能へ与える影響を測定するプログラムを書け。

解答:

64B～4KB程度までバッファサイズを変化させながら大容量ファイルを読み書きし、総時間と1回あたりの時間を測定して比較する。

48:

英文:

Implement a simulated file system that will be fully contained in a single regular file stored on the disk.

日本語訳:

単一ファイル内に仮想ファイルシステムを実装せよ。

解答:

1つの大きな通常ファイルを仮想ディスクとして利用し、その中にi-node、ディレクトリ、空きブロック管理領域、データ領域を配置する。コマンドとして作成・削除・読込み・書込み・一覧表示などを実装する。

#pagebreak()

= Input/Output

1:

英文:

Advances in chip technology have made it possible to put an entire controller, including all the bus access logic, on an inexpensive chip.

日本語訳:

バスアクセス回路を含むコントローラ全体を1チップ化できるようになった場合、図1-6のモデルはどう変化するか。

解答:

コントローラ機能がデバイス内部に統合されるため、CPUとデバイスの間の構成が簡単になり、独立したコントローラの存在感が小さくなる。

2:

英文:

Given the speeds listed in Fig. 5-1, is it possible to scan documents from a scanner and transmit them over an 802.11g network at full speed?

日本語訳:

スキャナのデータを802.11gでフル速度転送できるか。

解答:

可能である。802.11gは理論上54Mbpsであり、多くのスキャナの出力速度を上回る。

3:

英文:

A clever computer science student has thought of an improvement...

日本語訳:

メモリバスとI/Oバスを同時に試す方法は有効か。

解答:

通常は有効ではない。両方に同時アクセスすると競合や不要な処理が増え、回路も複雑になる。

4:

英文:

Explain the tradeoffs between precise and imprecise interrupts on a superscalar machine.

日本語訳:

スーパースカラCPUにおける正確割込みと不正確割込みのトレードオフを説明せよ。

解答:

正確割込みはOSが扱いやすいが実装が複雑で性能が低下する。不正確割込みは高速だが例外処理が難しい。

5:

英文:

A DMA controller has five channels.

日本語訳:

DMAコントローラのバス速度を求めよ。

解答:

1チャネルあたり40nsごとに32ビット要求。

5チャネルでは

5 × 32bit / 40ns

\= 4×10^9 bit/s

\= 500MB/s

以上のバス速度が必要である。

6:

英文:

Suppose that a system uses DMA for data transfer from disk controller to main memory.

日本語訳:

1000語転送に要する時間を求めよ。

解答:

(a) Word-at-a-time

各語ごとにバス獲得が必要なので

1000(t1+t2)

程度となる。

(b) Burst mode

バス獲得は1回なので

t1 + 1000t2

程度となる。

Burst modeの方が大幅に高速である。

7:

英文:

How can this mode be used to perform memory to memory copy?

日本語訳:

DMAを用いてメモリ間コピーする方法を説明せよ。

解答:

DMAがメモリから読んだデータを一時保持し、別アドレスへ書き込めばよい。CPU負荷を下げられるが、DMA設定のオーバーヘッドがある。

8:

英文:

Suppose that a computer can read or write a memory word in 5 nsec.

日本語訳:

最大割込み処理回数を求めよ。

解答:

保存対象は

32レジスタ + PC + PSW

\= 34語

保存34回＋復元34回

計68回アクセス

68 × 5ns = 340ns

最大割込み数

1 / 340ns

≈ 2.94×10^6回/秒

9:

英文:

One way to please the OS folks is for the CPU to stop issuing new instructions...

日本語訳:

現在実行中命令だけ完了してから割込みを発生させる方式の欠点は何か。

解答:

長時間実行される命令があると割込み応答時間が大きくなる。

10:

英文:

Could it have equally well been acknowledged right at the start of the interrupt service procedure?

日本語訳:

割込み受付をサービスルーチン開始時に行えるか。

解答:

可能である。ただし終了時に行うことで処理完了前の再割込み発生を防げる。

11:

英文:

A computer has a three-stage pipeline as shown in Fig. 1-7(a)...

日本語訳:

図1-7(a)のような3段パイプラインを持つコンピュータを考える。割込み発生時にPCを保存し、割込みハンドラへ分岐する。このマシンは正確な割込みを実現しているか。

解答:

実現していない。割込み発生時に既にパイプライン内へ投入された命令が残っているため、割込み時点の実行状態を一意に定められない。

12:

英文:

A typical printed page of text contains 50 lines of 80 characters each...

日本語訳:

1ページ50行、1行80文字の文書を毎分6ページ印刷するプリンタがある。1文字ごとに50μsかかる割込み処理を行う場合、割込み駆動I/Oは妥当か。

解答:

妥当である。印刷速度は毎秒400文字であり、割込み処理時間は400×50μs=20ms/秒なのでCPU負荷は約2%にすぎない。

13:

英文:

Explain how an OS can facilitate installation of a new device without any need for recompiling the OS.

日本語訳:

OSを再コンパイルせずに新しい装置を導入できるようにする方法を説明せよ。

解答:

デバイスドライバをモジュール化し、実行時にロード可能にすることでOS本体を変更せず新しい装置を追加できる。

14:

英文:

In which of the four I/O software layers is each of the following done?

日本語訳:

次の処理はI/Oソフトウェアのどの層で行われるか。

(a)
英文:

Computing the track, sector, and head for a disk read.

日本語訳:

ディスク読込みのためにトラック・セクタ・ヘッド番号を計算する。

解答:

デバイスドライバ層。

(b)
英文:

Writing commands to the device registers.

日本語訳:

装置レジスタへコマンドを書き込む。

解答:

デバイスドライバ層。

(c)
英文:

Checking to see if the user is permitted to use the device.

日本語訳:

利用者に装置使用権限があるか確認する。

解答:

装置非依存OSソフトウェア層。

(d)
英文:

Converting binary integers to ASCII for printing.

日本語訳:

整数を印字用ASCII文字列へ変換する。

解答:

ユーザレベルI/Oソフトウェア層。

15:

英文:

A local area network is used as follows...

日本語訳:

LAN上で1024バイトのパケットを送信する。割込み処理は1ms、メモリコピーは1バイト当たり1μsである。送信側は確認応答が返るまで待機するとき、最大転送速度を求めよ。

解答:

送信側コピー1.024ms、受信側コピー2.048ms、送受信割込み2ms、ネットワーク転送約0.819ms。
合計約5.9ms。
したがって最大転送速度は1024/0.0059 ≈ 173kB/s。

16:

英文:

Why are output files for the printer normally spooled on disk before being printed?

日本語訳:

なぜプリンタ出力は通常ディスクへスプールされてから印刷されるのか。

解答:

プリンタは低速なため、ディスクへ一旦保存しておくことで利用者を待たせず、複数ジョブの管理も容易になる。

17:

英文:

How much cylinder skew is needed for a 7200-RPM disk with a track-to-track seek time of 1 msec?

日本語訳:

7200RPM、トラック間シーク時間1ms、1トラック200セクタのディスクでは何セクタ分のシリンダスキューが必要か。

解答:

1回転は8.33ms。
1msで約24セクタ分回転するため、約24セクタのシリンダスキューが必要である。

18:

英文:

A disk rotates at 7200 RPM. It has 500 sectors of 512 bytes around the outer cylinder. How long does it take to read a sector?

日本語訳:

7200RPMで1周500セクタのディスクにおいて、1セクタを読む時間を求めよ。

解答:

1回転8.33ms。
8.33ms÷500≒16.7μs。

19:

英文:

Calculate the maximum data rate in bytes/sec for the disk described in the previous problem.

日本語訳:

前問のディスクの最大データ転送速度を求めよ。

解答:

500×512×120
=30,720,000B/s
≒30.7MB/s。

20:

英文:

RAID level 3 is able to correct single-bit errors using only one parity drive. What is the point of RAID level 2?

日本語訳:

RAID3は1台のパリティディスクだけで1ビット誤りを訂正できる。ではRAID2の存在意義は何か。

解答:

RAID2はハミング符号を用いて誤り訂正能力を持つ。しかし現在のディスクは内部ECCを備えているため、実用上はRAID3の方が効率的である。

21:

英文:

A RAID can fail if two or more of its drives crash within a short time interval. Suppose that the probability of one drive crashing in a given hour is p. What is the probability of a k-drive RAID failing in a given hour?

日本語訳:

RAIDは短時間のうちに2台以上のドライブが故障すると障害となる。1台のドライブが1時間以内に故障する確率をpとすると、k台のRAIDが1時間以内に故障する確率を求めよ。

解答:

故障確率は「2台以上故障する確率」であり、
1-(1-p)^k-kp(1-p)^(k-1)
で表される。

22:

英文:

Compare RAID level 0 through 5 with respect to read performance, write performance, space overhead, and reliability.

日本語訳:

RAIDレベル0～5について、読込み性能、書込み性能、容量オーバーヘッド、信頼性を比較せよ。

解答:

RAID0は高速だが冗長性がない。RAID1は高信頼だが容量効率が悪い。RAID2～4は冗長性を持つが専用パリティがボトルネックになりやすい。RAID5はパリティを分散することで性能と信頼性のバランスが良い。

23:

英文:

How many pebibytes are there in a zebibyte?

日本語訳:

1ゼビバイトは何ペビバイトか。

解答:

1 ZiB = 2^20 PiB = 1,048,576 PiB。

24:

英文:

Why are optical storage devices inherently capable of higher data density than magnetic storage devices?

日本語訳:

なぜ光学記憶装置は磁気記憶装置より高密度記録が可能なのか。

解答:

光の波長は磁気ヘッドが生成する磁場の広がりより小さいため、より微細な領域にデータを記録できる。

25:

英文:

What are the advantages and disadvantages of optical disks versus magnetic disks?

日本語訳:

光ディスクと磁気ディスクの長所と短所を比較せよ。

解答:

光ディスクは安価で耐久性が高く持ち運びや保存に適している。一方で磁気ディスクより容量や速度が低い。

26:

英文:

If a disk controller writes the bytes it receives from the disk to memory as fast as it receives them, with no internal buffering, is interleaving conceivably useful? Discuss your answer.

日本語訳:

ディスクコントローラが内部バッファを持たず、受信したデータを即座にメモリへ転送する場合、インタリーブは有用か。

解答:

有用である可能性がある。CPUやDMAが処理に追いつかない場合、セクタ間に余裕を設けることでデータ取りこぼしを防げる。

27:

英文:

If a disk has double interleaving, does it also need cylinder skew in order to avoid missing data when making a track-to-track seek? Discuss your answer.

日本語訳:

ディスクが2倍インタリーブを採用している場合でも、トラック間シーク時にシリンダスキューは必要か。

解答:

必要である。インタリーブは同一トラック内の問題を解決するが、トラック切替中の回転遅延は別途考慮しなければならない。

28:

英文:

Consider a magnetic disk consisting of 16 heads and 400 cylinders...

日本語訳:

16ヘッド、400シリンダからなる磁気ディスクについて、(a)容量、(b)最適トラックスキュー、(c)最大転送速度を求めよ。

解答:

(a)
総容量
=100×16×(160+200+240+280)×512
=720,896,000B
≒687.5MiB

(b)
1msのシーク中に回転する割合は
1÷8.33≒0.12回転
したがって最適トラックスキューは各ゾーンの約12%のセクタ数である。

(c)
最大転送速度は最外周ゾーンで
280×512×120
=17,203,200B/s
≒17.2MB/s。

29:

英文:

A disk manufacturer has two 5.25-inch disks that each have 10,000 cylinders. The newer one has double the linear recording density of the older one. Which disk properties are better on the newer drive and which are the same? Are any worse on the newer one?

日本語訳:

同じ10000シリンダを持つ2台の5.25インチディスクがある。新型は線記録密度が2倍である。どの特性が向上し、どの特性が同じで、悪化するものはあるか。

解答:

容量と転送速度は向上する。シーク時間や回転待ち時間は変化しない。通常は悪化する特性はない。

30:

英文:

A computer manufacturer decides to redesign the partition table of a Pentium hard disk to provide more than four partitions. What are some consequences of this change?

日本語訳:

あるメーカーがPentium用ハードディスクのパーティションテーブルを変更し、4個を超えるパーティションを直接サポートすることにした。この変更の影響は何か。

解答:

既存OSやブートローダとの互換性が失われる可能性がある。またディスク管理ツールの修正も必要となる。

31:

英文:

Disk requests come in to the disk driver for cylinders 10, 22, 20, 2, 40, 6, and 38, in that order. A seek takes 6 msec per cylinder. How much seek time is needed for (a) First-come, first served. (b) Closest cylinder next. (c) Elevator algorithm (initially moving upward). In all cases, the arm is initially at cylinder 20.

日本語訳:

シリンダ10, 22, 20, 2, 40, 6, 38への要求がこの順で到着する。シークは1シリンダ当たり6msかかる。アーム初期位置を20として、(a)FCFS、(b)最短シーク優先、(c)エレベータ方式（上方向開始）のシーク時間を求めよ。

解答:

(a)
移動距離
=10+12+2+18+38+34+32
=146
→876ms

(b)
順序:
20→20→22→10→6→2→38→40
移動距離
=40
→240ms

(c)
順序:
20→20→22→38→40→10→6→2
移動距離
=58
→348ms

32:

英文:

A slight modification of the elevator algorithm for scheduling disk requests is to always scan in the same direction. In what respect is this modified algorithm better than the elevator algorithm?

日本語訳:

エレベータアルゴリズムを少し変更し、常に同じ方向へ走査する方式を考える。この方式はどの点で優れているか。

解答:

待ち時間がより均一になる。中央付近のシリンダが頻繁に優遇される問題を軽減できる。

33:

英文:

A personal computer salesman visiting a university in South-West Amsterdam remarked during his sales pitch that his company had devoted substantial effort to making their version of UNIX very fast...

日本語訳:

営業担当者はエレベータアルゴリズムやセクタ順最適化によって高速化したと説明した。しかし学生がランダム読込みを行ったところ、FCFSと同程度の性能しか得られなかった。営業担当者は嘘をついていたのか。

解答:

嘘とは限らない。要求が1件ずつ発生する場合は並べ替える待ち行列が存在せず、どのアルゴリズムもFCFSと同じ動作になる。

34:

英文:

In the discussion of stable storage using nonvolatile RAM, the following point was glossed over...

日本語訳:

不揮発RAMを用いた安定記憶で、安定書込み完了後に無効ブロック番号を書き込む前にクラッシュした場合はどうなるか。この競合状態は安定記憶の抽象化を壊すか。

解答:

壊さない。再起動時にブロック番号が残っていれば回復処理を再実行できるため、一貫性は維持される。

35:

英文:

In the discussion on stable storage, it was shown that the disk can be recovered to a consistent state if a CPU crash occurs during a write. Does this property hold if the CPU crashes again during a recovery procedure?

日本語訳:

安定記憶では書込み中のクラッシュから回復できることが示された。回復処理中に再びクラッシュした場合でもこの性質は成り立つか。

解答:

成り立つ。回復処理自体が再実行可能な設計になっているため、何度クラッシュしても最終的に整合状態へ復帰できる。

36:

英文:

In the discussion on stable storage, a key assumption is that a CPU crash that corrupts a sector leads to an incorrect ECC. What problems might arise if this assumption does not hold?

日本語訳:

安定記憶では、破損したセクタはECC異常を起こすと仮定している。この仮定が成り立たない場合、どのような問題が生じるか。

解答:

破損データが正常データと誤認される可能性がある。その結果、回復処理が誤ったデータを採用し、一貫性が失われる。

37:

英文:

The clock interrupt handler on a certain computer requires 2 msec (including process switching overhead) per clock tick. The clock runs at 60 Hz. What fraction of the CPU is devoted to the clock?

日本語訳:

クロック割込み処理に1回当たり2msかかり、クロック周波数は60Hzである。CPU時間の何割がクロック処理に使われるか。

解答:

60×2ms=120ms/秒。
CPU使用率は12%。

38:

英文:

A computer uses a programmable clock in square-wave mode. If a 500 MHz crystal is used, what should be the value of the holding register to achieve a clock resolution of (a) a millisecond? (b) 100 microseconds?

日本語訳:

500MHzの水晶発振器を持つプログラマブルクロックで、(a)1ms、(b)100μsの分解能を得るためのカウンタ値を求めよ。

解答:

(a)
500MHz×1ms
=500,000

(b)
500MHz×100μs
=50,000

39:

英文:

A system simulates multiple clocks by chaining all pending clock requests together as shown in Fig. 5-30...

日本語訳:

図5-30のように複数タイマ要求を連結リストで管理している。時刻5000に要求が5008, 5012, 5015, 5029, 5037である場合、各時刻での状態を示せ。

解答:

5000時点:

Current time=5000
Clock header=8→4→3→14→8
Next signal=5008

5005時点:

Current time=5005
Clock header=3→4→3→14→8
Next signal=5008

5013時点:

Current time=5013
Clock header=2→14→8
Next signal=5015

5017に5033を追加後、5023時点:

Current time=5023
Clock header=6→4
Next signal=5029

40:

英文:

Many versions of UNIX use an unsigned 32-bit integer to keep track of the time as the number of seconds since the origin of time. When will these systems wrap around (year and month)? Do you expect this to actually happen?

日本語訳:

多くのUNIXでは時刻を32ビット符号なし整数で管理している。この値はいつオーバーフローするか。また実際に問題になると思うか。

解答:

2^32秒は約136年。
1970年起点なら2106年2月頃にオーバーフローする。
それまでにシステム更新が進むと考えられるが、組込み機器では問題になる可能性がある。

41:

英文:

A bitmap terminal contains 1600 by 1200 pixels...

日本語訳:

1600×1200ピクセルのビットマップ端末について、スクロール時間、等価ボーレート、表示可能行数を求めよ。

解答:

ウィンドウサイズは640×1280ピクセル。
データ量は819,200ビット=102,400バイト。
スクロール時間は約5.12ms。
80文字×50行=4000文字/ページより、等価ボーレートは約625,000bps。
1文字5μsなので1秒当たり200,000文字、約2500行表示できる。

42:

英文:

After receiving a DEL (SIGINT) character, the display driver discards all output currently queued for that display. Why?

日本語訳:

DEL(SIGINT)を受信すると表示ドライバはキュー中の出力を破棄する。なぜか。

解答:

中断されたプログラムの不要な出力が後から表示されるのを防ぎ、端末表示を整合した状態に保つためである。

43:

英文:

A user at a terminal issues a command to an editor to delete the word on line 5 occupying character positions 7 through and including 12...

日本語訳:

カーソルが5行目以外にあるとき、5行目7～12文字目の単語を削除するためにエディタはどのANSIエスケープシーケンスを送るべきか。

解答:

カーソルを5行7列へ移動し、その位置から6文字削除するシーケンスを送る。
例:

ESC[5;7H ESC[6P

44:

英文:

The designers of a computer system expected that the mouse could be moved at a maximum rate of 20 cm/sec...

日本語訳:

マウス速度20cm/s、1ミッキー0.1mm、1メッセージ3バイトの場合の最大データ転送速度を求めよ。

解答:

20cm/s=2000ミッキー/s。
3バイトずつ送るので6000B/s。

45:

英文:

The primary additive colors are red, green, and blue... Is it possible that someone could have a color photograph that cannot be represented using full 24-bit color?

日本語訳:

RGBの24ビットカラーでも表現できない写真は存在するか。

解答:

存在する。人間が識別可能な色空間は24ビットRGBより広いため、一部の色は近似表現になる。

46:

英文:

One way to place a character on a bitmapped screen is to use BitBlt from a font table...

日本語訳:

16×24ピクセル、24ビットカラーのフォントについて、(a)文字当たり容量、(b)表示速度を求めよ。

解答:

(a)
16×24×3
=1152バイト

(b)
1152×100ns
=115.2μs/文字
約8680文字/秒。

47:

英文:

Assuming that it takes 2 nsec to copy a byte, how much time does it take to completely rewrite the screen...

日本語訳:

1バイトのコピーに2nsかかるとき、80×25文字画面と1024×768・24ビットカラー画面を書き換える時間を求めよ。

解答:

テキスト画面:

80×25×2B=4000B
→8μs

グラフィック画面:

1024×768×3B
=2,359,296B
→約4.72ms

48:

英文:

In Fig. 5-36 there is a call to RegisterClass. In the corresponding X Window code, in Fig. 5-34, there is no such call or anything like it. Why not?

日本語訳:

WindowsにはRegisterClassがあるが、X Windowには対応する呼出しがない。なぜか。

解答:

X Windowではウィンドウ管理機構がサーバ側にあり、アプリケーションが独自クラスを登録する必要がないためである。

49:

英文:

In the text we gave an example of how to draw a rectangle on the screen using the Windows GDI. Is there any real need for the first parameter (hdc)?

日本語訳:

Windows GDIのRectangle関数において、座標が与えられているにもかかわらずhdcは必要か。

解答:

必要である。同じ座標でも描画対象となるウィンドウやプリンタなどのデバイスを識別するためである。

50:

英文:

A thin-client terminal is used to display a Web page containing an animated cartoon of size 400 pixels × 160 pixels running at 10 frames/sec. What fraction of a 100-Mbps Fast Ethernet is consumed?

日本語訳:

400×160ピクセル、10fpsのアニメーションを表示する場合、100Mbps Fast Ethernetの何割を消費するか。

解答:

400×160×3×10
=1,920,000B/s
≈15.36Mbps。
回線の約15.4%を使用する。

51:

英文:

It has been observed that a thin-client system works well with a 1-Mbps network in a test. Are any problems likely in a multiuser situation?

日本語訳:

1Mbps回線でシンクライアントが正常に動作した。多人数環境では問題が生じるか。

解答:

生じる可能性がある。多数の利用者が同時に動画などを閲覧すると帯域競合が発生し性能が大きく低下する。

52:

英文:

Describe two advantages and two disadvantages of thin client computing.

日本語訳:

シンクライアントの利点2つと欠点2つを述べよ。

解答:

利点は管理が容易で保守コストが低いこと、端末性能への依存が小さいこと。
欠点はネットワーク障害に弱いこと、高負荷時にサーバがボトルネックになることである。

53:

英文:

If a CPU’s maximum voltage, V, is cut to V/n...

日本語訳:

電圧をV/nに下げると消費電力は1/n²、速度は1/nになる。1文字/秒入力され、処理に100ms必要な場合、最適なnと省エネ率を求めよ。

解答:

CPU利用率100ms/秒なので速度は10分の1まで下げられる。
n=10。
消費電力は1/100になるが実行時間は10倍。
エネルギー消費は1/10。
約90%削減できる。

54:

英文:

A notebook computer is set up to take maximum advantage of power saving features...

日本語訳:

ノートPCでテキストモード利用時の方がX Window利用時より電池寿命が長いのはなぜか。

解答:

X Windowでは画面更新や描画処理が頻繁に発生し、CPU・GPU・ディスプレイの消費電力が増加するためである。

55:

英文:

Write a program that simulates stable storage.

日本語訳:

安定記憶をシミュレートするプログラムを作成せよ。

解答:

2つの固定長ファイルを用意し、両方へ書込み後に正常終了した場合のみ完了とみなす方式で実装できる。

56:

英文:

Write a program to implement the three disk-arm scheduling algorithms.

日本語訳:

3種類のディスクアームスケジューリングアルゴリズムを実装するプログラムを作成せよ。

解答:

FCFS、SSTF、SCANを実装し、ランダムな要求列に対する総移動距離を比較する。

57:

英文:

Write a program to implement multiple timers using a single clock.

日本語訳:

単一クロックによる複数タイマ管理プログラムを作成せよ。

解答:

現在時刻とタイマ要求を差分付き連結リストで管理し、クロック割込みごとに先頭要素を減算して期限到達時にシグナルを発生させる。

#pagebreak()

= Deadlocks

1:

英文:

Give an example of a deadlock taken from politics.

日本語訳:

政治の世界におけるデッドロックの例を挙げよ。

解答:

与党と野党が互いに譲歩を拒否し、法案成立にも予算承認にも応じない状態はデッドロックの例である。

2:

英文:

Students working at individual PCs in a computer laboratory send their files to be printed by a server that spools the files on its hard disk...

日本語訳:

印刷スプール用ディスク容量が限られている場合、どのような条件でデッドロックが発生するか。また回避方法を述べよ。

解答:

各利用者がディスク容量の一部を確保したまま追加容量を待つとデッドロックが発生する。十分な容量を事前確保するか、容量不足時はジョブ受付を拒否することで回避できる。

3:

英文:

In the preceding question, which resources are preemptable and which are nonpreemptable?

日本語訳:

前問において、どの資源がプリエンプト可能で、どの資源が不可能か。

解答:

ディスク領域は回収可能なのでプリエンプト可能である。印刷中のプリンタは途中で取り上げにくいためプリエンプト不可能である。

4:

英文:

In Fig. 6-1 the resources are returned in the reverse order of their acquisition. Would giving them back in the other order be just as good?

日本語訳:

図6-1では資源を獲得と逆順に返却している。別の順序で返却してもよいか。

解答:

よい。全資源が最終的に解放されるなら返却順序自体は本質的ではない。

5:

英文:

The four conditions (mutual exclusion, hold and wait, no preemption and circular wait) are necessary for a resource deadlock to occur...

日本語訳:

4つの必要条件はデッドロック発生に十分ではないことを示せ。また、いつ十分条件になるか。

解答:

4条件が成立していても実際に循環待ちが形成されなければデッドロックは発生しない。資源割当てグラフに循環が存在するとき十分条件となる。

6:

英文:

City streets are vulnerable to a circular blocking condition called gridlock...

日本語訳:

「交差点をふさぐな」方式はどのデッドロック防止法に相当するか。また他の防止法を挙げよ。

解答:

Hold and Wait条件の否定に相当する。ほかには一方通行化、優先道路の設定、信号制御などがある。

7:

英文:

Suppose four cars each approach an intersection from four different directions simultaneously...

日本語訳:

4台の車が同時に交差点へ到着し、全車が右側優先規則に従って待機する。この現象は通信デッドロックか資源デッドロックか。

解答:

交差点という資源を互いに待っているため資源デッドロックである。通信デッドロックではない。

8:

英文:

Is it possible that a resource deadlock involves multiple units of one type and a single unit of another?

日本語訳:

複数個存在する資源と単一資源が関与するデッドロックは起こり得るか。

解答:

起こり得る。例えば2台のプリンタと1台のスキャナを複数プロセスが保持し合う場合である。

9:

英文:

Fig. 6-3 shows the concept of a resource graph. Do illegal graphs exist?

日本語訳:

資源グラフにおいてモデル上あり得ない不正なグラフは存在するか。

解答:

存在する。例えばプロセスからプロセスへの辺や、資源から資源への辺はモデル違反である。

10:

英文:

Consider Fig. 6-4. Suppose that in step (o) C requested S instead of requesting R...

日本語訳:

図6-4でCがRではなくSを要求した場合、あるいはRとSの両方を要求した場合はどうなるか。

解答:

Sのみなら循環待ちが生じずデッドロックにならない可能性が高い。RとSの両方を要求するとデッドロックになる可能性が高まる。

11:

英文:

Suppose that there is a resource deadlock in a system...

日本語訳:

デッドロックしたプロセス集合に、循環待ちの輪に含まれないプロセスが入る例を示せ。

解答:

循環待ち中のプロセスが保持する資源を待っている第三のプロセスも実行不能になるため、循環に含まれなくてもデッドロック集合に含まれる。

12:

英文:

In order to control traffic, a network router, A periodically sends a message to its neighbor, B...

日本語訳:

ルータAがウィンドウサイズを0にし、その後再開指示メッセージが失われた結果、双方が永久に送信しなくなった。このデッドロックは何か。

解答:

通信デッドロックである。資源不足ではなく、制御メッセージの欠落により相互待機状態になっている。

13:

英文:

The discussion of the ostrich algorithm mentions the possibility of process-table slots or other system tables filling up...

日本語訳:

プロセステーブルなどが満杯になった場合、システム管理者が回復できる方法を提案せよ。

解答:

管理者専用の予約スロットを確保しておき、緊急時でもログインして不要プロセスを終了できるようにする。

14:

英文:

Consider the following state of a system with four processes...

日本語訳:

与えられた資源状態について、デッドロック検出アルゴリズムを用いてデッドロックを示し、該当プロセスを特定せよ。

解答:

アルゴリズムを適用すると一部のプロセスが完了できず循環待ちとなる。デッドロックしているプロセスはP2、P3、P4である。

15:

英文:

Explain how the system can recover from the deadlock in previous problem using...

日本語訳:

前問のデッドロックから以下の方法で回復する方法を説明せよ。

(a)
英文:

Recovery through preemption.

日本語訳:

資源のプリエンプションによる回復。

解答:

一部プロセスから資源を強制回収し、他のプロセスを完了させる。

(b)
英文:

Recovery through rollback.

日本語訳:

ロールバックによる回復。

解答:

チェックポイントまで戻し、資源を解放した状態から再実行する。

(c)
英文:

Recovery through killing processes.

日本語訳:

プロセス終了による回復。

解答:

デッドロック中のプロセスを1つ以上強制終了し、資源を解放する。

16:

英文:

Suppose that in Fig. 6-6 Cij + Rij > Ej for some i. What implications does this have for the system?

日本語訳:

図6-6であるiについて Cij + Rij > Ej が成り立つ場合、どのような意味を持つか。

解答:

そのプロセスの要求量がシステム総資源数を超えているため、絶対に完了できない。

17:

英文:

All the trajectories in Fig. 6-8 are horizontal or vertical. Can you envision any circumstances in which diagonal trajectories are also possible?

日本語訳:

図6-8の軌跡は水平または垂直である。対角線状の軌跡が生じる状況はあるか。

解答:

複数プロセスが完全に同時進行すると仮定すれば対角線状の軌跡も考えられる。

18:

英文:

Can the resource trajectory scheme of Fig. 6-8 also be used to illustrate the problem of deadlocks with three processes and three resources?

日本語訳:

図6-8の資源軌跡法は3プロセス・3資源の場合にも利用できるか。

解答:

利用できる。ただし3次元以上の空間が必要となり、図示が困難になる。

19:

英文:

In theory, resource trajectory graphs could be used to avoid deadlocks...

日本語訳:

理論上は資源軌跡グラフを用いて安全でない領域を避けられる。実際に利用可能か。

解答:

一般には困難である。プロセス数や資源数が増えると状態空間が爆発的に増加するためである。

20:

英文:

Can a system be in a state that is neither deadlocked nor safe?

日本語訳:

システムは「デッドロックでも安全状態でもない状態」になり得るか。

解答:

なり得る。不安全状態は必ずしもデッドロックではなく、将来的にデッドロックへ進む可能性を持つ状態である。

21:

英文:

Take a careful look at Fig. 6-11(b). If D asks for one more unit, does this lead to a safe state or an unsafe one? What if the request came from C instead of D?

日本語訳:

図6-11(b)でDがさらに1単位要求した場合は安全状態か不安全状態か。またCが要求した場合はどうか。

解答:

Dの要求は安全状態を不安全状態へ移行させる可能性がある。Cの要求は安全状態を維持できる場合が多い。

22:

英文:

A system has two processes and three identical resources. Each process needs a maximum of two resources. Is deadlock possible? Explain your answer.

日本語訳:

2つのプロセスと3個の同一資源がある。各プロセスは最大2個の資源を必要とする。デッドロックは発生するか。

解答:

発生しない。片方が1個保持しても残り2個のうち1個を取得して完了できるため、循環待ちにならない。

23:

英文:

Consider the previous problem again, but now with p processes each needing a maximum of m resources and a total of r resources available. What condition must hold to make the system deadlock free?

日本語訳:

前問を一般化し、p個のプロセスがそれぞれ最大m個の資源を必要とし、総資源数がr個である。デッドロックを防ぐ条件を求めよ。

解答:

r ≥ p(m−1)+1
が成り立てばデッドロックは発生しない。

24:

英文:

Suppose that process A in Fig. 6-12 requests the last tape drive. Does this action lead to a deadlock?

日本語訳:

図6-12において、プロセスAが最後のテープドライブを要求するとデッドロックになるか。

解答:

必ずしもならない。安全系列が存在するかどうかを確認する必要がある。

25:

英文:

The banker’s algorithm is being run in a system with m resource classes and n processes...

日本語訳:

資源クラス数m、プロセス数nのシステムで銀行家アルゴリズムを実行する。安全性判定の計算量はmanbに比例するとき、aとbを求めよ。

解答:

安全性判定はO(mn²)である。
したがって a=1、b=2。

26:

英文:

A system has four processes and five allocatable resources...

日本語訳:

与えられた資源割当て表について、安全状態となる最小のxを求めよ。

解答:

銀行家アルゴリズムを適用すると、最小値は x=1 である。

27:

英文:

One way to eliminate circular wait is to have rule saying that a process is entitled only to a single resource at any moment...

日本語訳:

各プロセスが同時に1つの資源しか保持できないようにすると循環待ちは防げる。この制約が実用的でない例を示せ。

解答:

コンパイラが入力ファイルと出力ファイルを同時に開く場合など、多くの実用プログラムは複数資源を同時に必要とする。

28:

英文:

Two processes, A and B, each need three records, 1, 2, and 3, in a database...

日本語訳:

2プロセスが3資源を要求する順序の組合せは全部で36通りある。必ずデッドロックが起こらない組合せの割合を求めよ。

解答:

両プロセスが同じ順序で要求する場合のみ保証される。
6通り中6通り。
全体36通り中6通りなので、
1/6である。

29:

英文:

A distributed system using mailboxes has two IPC primitives, send and receive...

日本語訳:

メールボックス方式の分散システムでは共有資源が存在しない。この場合でもデッドロックは起こるか。

解答:

起こり得る。互いにメッセージ受信を待つプロセス同士が存在すると通信デッドロックが発生する。

30:

英文:

In an electronic funds transfer system, there are hundreds of identical processes...

日本語訳:

送金システムで2つの口座をロックしてから送金する場合、デッドロックを防ぐ方法を提案せよ。

解答:

全口座に一意な番号を付け、常に番号の小さい口座から先にロックする。資源取得順序を統一することで循環待ちを防げる。

31:

英文:

One way to prevent deadlocks is to eliminate the hold-and-wait condition...

日本語訳:

新しい資源要求前に現在の資源を解放させる方式には欠点がある。この方式を改良せよ。

解答:

必要な資源集合をあらかじめ予約し、すべて同時に確保できる場合のみ割り当てる方式にする。
これにより既存資源を失う問題を軽減できる。

32:

英文:

A computer science student assigned to work on deadlocks thinks of the following brilliant way to eliminate deadlocks...

日本語訳:

資源要求時に時間制限を設定し、待機時間を超えたら再開させる方法が提案された。この案をどう評価するか。

解答:

高評価はできない。単に待機を解除するだけでは資源競合の原因が解決されず、デッドロックやライブロックが発生する可能性がある。

33:

英文:

Main memory units are preempted in swapping and virtual memory systems. The processor is preempted in time-sharing environments. Do you think that these preemption methods were developed to handle resource deadlock or for other purposes? How high is their overhead?

日本語訳:

主記憶はスワッピングや仮想記憶でプリエンプトされ、CPUはタイムシェアリングでプリエンプトされる。これらはデッドロック対策として開発されたのか。またオーバーヘッドはどの程度か。

解答:

主目的は資源利用効率や応答性の向上であり、デッドロック対策ではない。オーバーヘッドは存在するが、得られる利点に比べて十分小さい。

34:

英文:

Explain the differences between deadlock, livelock, and starvation.

日本語訳:

デッドロック、ライブロック、スタベーションの違いを説明せよ。

解答:

デッドロックは全員が停止して進まない状態である。ライブロックは動作しているが進展がない状態である。スタベーションは一部のプロセスだけが永続的に実行機会を得られない状態である。

35:

英文:

Assume two processes are issuing a seek command to reposition the mechanism to access the disk...

日本語訳:

2つのプロセスが互いにディスクアーム位置を変更し続け、読込みが実行できない。この現象はデッドロックかライブロックか。また対策を述べよ。

解答:

ライブロックである。両者は動作しているが進展しない。排他制御や要求キューによる順序管理で解決できる。

36:

英文:

Local Area Networks utilize a media access method called CSMA/CD...

日本語訳:

CSMA/CDで衝突後に即座に再送を繰り返すと永久に衝突する可能性がある。

(a)
英文:

Is this a resource deadlock or a livelock?

日本語訳:

これは資源デッドロックかライブロックか。

解答:

ライブロックである。

(b)
英文:

Can you suggest a solution to this anomaly?

日本語訳:

解決策を提案せよ。

解答:

ランダムなバックオフ時間を導入する。

(c)
英文:

Can starvation occur with this scenario?

日本語訳:

スタベーションは起こり得るか。

解答:

起こり得る。ある端末が繰り返し衝突に負ける可能性がある。

37:

英文:

A program contains an error in the order of cooperation and competition mechanisms...

日本語訳:

コンシューマがmutex取得後に空バッファ待ちを行い、プロデューサはmutex待ちになる。この現象は資源デッドロックか通信デッドロックか。また対策を述べよ。

解答:

資源デッドロックと通信デッドロックの両方の性質を持つ。待機前にmutexを解放する、または同期順序を修正することで防げる。

38:

英文:

Cinderella and the Prince are getting divorced...

日本語訳:

シンデレラと王子が財産分割をコンピュータへ任せたところ、交渉が終わらなかった。なぜか。デッドロックやスタベーションは起こるか。

解答:

双方が同じ財産を要求し続けて取り消しを繰り返すため進展しない。ライブロックが発生している。デッドロックは必須ではないが、スタベーションは起こり得る。

39:

英文:

A student majoring in anthropology and minoring in computer science has embarked on a research project...

日本語訳:

ロープを渡るヒヒの問題について、デッドロックを防ぐセマフォプログラムを作成せよ。

解答:

東向き・西向きそれぞれの通行数を管理し、反対方向のヒヒがいる間は進入禁止にする。ロープ全体を方向ごとに排他的に利用させる。

40:

英文:

Repeat the previous problem, but now avoid starvation.

日本語訳:

前問に加えてスタベーションも防止せよ。

解答:

待機中の反対方向ヒヒが存在する場合、新規進入を禁止するフラグを導入する。ロープが空になった時点で進行方向を切り替える。

41:

英文:

Program a simulation of the banker’s algorithm.

日本語訳:

銀行家アルゴリズムのシミュレータを作成せよ。

解答:

各プロセスの要求を順に受け付け、安全性判定を実行し、安全なら割当て、不安全なら拒否するプログラムを実装する。

42:

英文:

Write a program to implement the deadlock detection algorithm with multiple resources of each type.

日本語訳:

複数資源型のデッドロック検出アルゴリズムを実装せよ。

解答:

E、C、Rを入力として利用可能資源を計算し、完了可能なプロセスを順次除外することでデッドロックプロセスを検出する。

43:

英文:

Write a program that detects if there is a deadlock in the system by using a resource allocation graph.

日本語訳:

資源割当てグラフを用いてデッドロック検出を行うプログラムを作成せよ。

解答:

グラフ内の循環を探索し、循環に含まれるプロセスをデッドロックとして出力する。

44:

英文:

In certain countries, when two people meet they bow to each other...

日本語訳:

同時にお辞儀すると永久にお辞儀し続ける状況を避けるプログラムを作成せよ。

解答:

一方に優先権を与えるか、乱数やID順によって先にお辞儀する側を決定することでデッドロックを防げる。