#import "../format/report_format.typ": *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/codelst:2.0.0": sourcecode

// #import "@preview/physica:0.9.2"
#show: master_thesis.with(
  title: "OS特論",
  subtitle: "Assignment 2",
  author: "Tatsuya Kawaguchi",
  id: "2510414",
  university: "JAIST",
  bibliography-file: "../bib/os_report2.bib",
)

= 銀行口座の入出金を処理するプログラム

== セマフォ

セマフォ方式では、セマフォの初期値を1として利用した。

スレッドは wait() によりセマフォ値を減少させてクリティカルリージョンへ入る。

セマフォ値が0の場合は待機する。

処理終了後に post() を実行してセマフォ値を増加させることで、待機中のスレッドが実行可能となる。

今回の実装では初期値を1としたため、一度に1つのスレッドのみがクリティカルリージョンへ入ることができる。

#img(
    image("Figures/semaphore.png", width: 60%),
    caption: "セマフォの図"
)

#pagebreak()

== 相互排除

mutex方式では、スレッドはクリティカルリージョンへ入る前にロックを取得する。

既に他のスレッドがロックを保持している場合は待機する。

ロックを取得したスレッドのみが口座残高を更新できるため、同時更新が発生しない。

その結果、残高の整合性が保たれる。

#img(
    image("Figures/mutex.png", width: 60%),
    caption: "相互排除の図"
)

#v(10em)

== メッセージ通信

メッセージ通信方式では、トークンを1つだけ保持するメッセージキューを利用した。

スレッドはトークンを受信した場合のみクリティカルリージョンへ入ることができる。

処理終了後にトークンをキューへ返却することで、他のスレッドが実行可能となる。

そのため、同時に複数のスレッドが口座残高を更新することはなく、正しい結果が得られる。

#img(
    image("Figures/message.png", width: 60%),
    caption: "メッセージ通信の図"
)

#pagebreak()

#text(size: 1.5em)[(4)] 

本課題では、mutex を用いて semaphore を実装し、また semaphore を用いて mutex を実装した。

これらの結果から、少なくとも相互排除を実現するという目的においては、両者は互いに表現可能であり、本質的な記述能力の差はないと考えられる。

また、メッセージ通信についても、トークンを1個だけ流通させることでクリティカルリージョンへの同時進入を防止できた。

これは mutex や semaphore が提供する相互排除機能と等価である。

このように、本課題で扱った mutex、semaphore、メッセージ通信はいずれも相互排除を実現できるため、計算能力や記述能力に優劣があるというよりも、同じ機能を異なる抽象化レベルで提供していると考えられる。

ただし実装の容易さや用途には違いがある。mutex は相互排除に特化しているため実装が単純であり、共有データ保護に適している。

一方 semaphore は資源数の管理にも利用できるためより汎用的である。

さらにメッセージ通信は共有メモリを直接扱わないため、分散システムやプロセス間通信に適している。

したがって、本課題で扱った同期プリミティブの間に本質的な記述能力の優劣はないが、適した利用場面や抽象化の方法には違いがあると考えられる。

#text(size: 1.5em)[(5)] 

strict alternation では共有変数 turn を用いて実行権を管理する。

例えば turn=0 のときは Thread0 のみがクリティカルリージョンへ入ることができ、処理終了後に turn=1 とすることで Thread1 に実行権を渡す。

本課題では 2 個のスレッドがほぼ同一の処理を繰り返すため、strict alternation によって相互排除を実現できた。

実行結果においても Processed balance と Correct balance が一致し、口座残高の整合性が保たれていることを確認した。

しかし、strict alternation は一般的な同期手法としては問題が多い。

例えば Thread0 がクリティカルリージョンへ入る必要がない場合でも、turn が Thread0 を指している限り Thread1 は待機し続けなければならない。

つまりクリティカルリージョンが空いているにもかかわらず進行できない状況が発生する。

さらに、一方のスレッドが停止した場合や極端に遅い場合には、もう一方のスレッドも永久に待ち続ける可能性がある。

このため strict alternation は相互排除条件は満たすものの、進行条件(progress condition)を満たさない。

mutex や semaphore では、クリティカルリージョンが空いていれば実行可能なスレッドが直ちに入ることができるため、この問題は発生しない。

以上より、strict alternation は相互排除を実現することはできるが、効率や進行性の観点から実用的な同期手法ではなく、現在のOSでは mutex や semaphore が用いられている。

#pagebreak()

= コード

== bank_op.c

```c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <pthread.h>
#include <string.h>

#include "bank_op_verify.h"
#include "my_sync.h"


#define NUM_OPS_PER_THREAD 10000
#define NUM_THREADS 2
#define DEBUG 0

int account_balance = 10000;

sync_mode_t sync_mode = SYNC_NONE;

void account_op(int amount, int thread_id)
{
	my_sync_enter(sync_mode, thread_id);
	
	/* vvv critical region vvv */

	int balance = account_balance;
	int balance_new = balance + amount;

	if (balance_new >= 0) {
#if DEBUG
		printf("%d%+d=%d\n", balance, amount, balance_new);
#endif
		account_balance = balance_new;
	} else {
#if DEBUG
		printf("%d%+d (balance falling short)\n", balance, amount);
#endif
		;
	}

	v_account_op(amount);

	/* ^^^ critical region ^^^*/

	my_sync_leave(sync_mode, thread_id);
}

void *work_thread(void *ptr)
{
	int amount;
	int thread_id = *(int *)ptr;

	for (int i = 0; i < NUM_OPS_PER_THREAD; i++) {
		amount = random() % 2000 - 1000;
		account_op(amount, thread_id);
	}

	return NULL;
}

/* 文字列から同期方式を選ぶ */
sync_mode_t parse_sync_mode(int argc, char **argv)
{
	if (argc < 2) return SYNC_NONE;
	if (strcmp(argv[1], "sem") == 0) return SYNC_SEM;
	if (strcmp(argv[1], "mutex") == 0) return SYNC_MUTEX;
	if (strcmp(argv[1], "msg") == 0) return SYNC_MSG;
	if (strcmp(argv[1], "sem_by_mutex") == 0) return SYNC_SEM_BY_MUTEX;
	if (strcmp(argv[1], "mutex_by_sem") == 0) return SYNC_MUTEX_BY_SEM;
	if (strcmp(argv[1], "strict") == 0) return SYNC_STRICT;
	return SYNC_NONE;
}

int main(int argc, char **argv)
{
	int i;
	pthread_t thread[NUM_THREADS];
	int thread_id[NUM_THREADS];

	srandom(time(NULL));
	v_init(account_balance);

	sync_mode = parse_sync_mode(argc, argv);
	my_sync_init(sync_mode, NUM_THREADS);

	for (i = 0; i < NUM_THREADS; i++) {
		thread_id[i] = i;
		pthread_create(&thread[i], NULL, work_thread, &thread_id[i]);
	}

	for (i = 0; i < NUM_THREADS; i++) {
		pthread_join(thread[i], NULL);
	}

	my_sync_destroy(sync_mode);

	printf("Processed balance : %d\n", account_balance);
	int correct_balance = v_fin();
	printf("Correct balance : %d\n", correct_balance);

	return 0;
}
```
\
== my_sync.h

```c
#ifndef MY_SYNC_H
#define MY_SYNC_H

#include <pthread.h>
#include <semaphore.h>

typedef struct {
	pthread_mutex_t pmutex;
} my_mutex_t;

extern int my_mutex_init(my_mutex_t *mutex);
extern int my_mutex_lock(my_mutex_t *mutex);
extern int my_mutex_unlock(my_mutex_t *mutex);
extern int my_mutex_destroy(my_mutex_t *mutex);

typedef struct {
	sem_t psem;
} my_sem_t;

extern int my_sem_init(my_sem_t *sem);
extern int my_sem_wait(my_sem_t *sem);
extern int my_sem_post(my_sem_t *sem);
extern int my_sem_destroy(my_sem_t *sem);

typedef enum {
	SYNC_NONE = 0,
	SYNC_SEM,
	SYNC_MUTEX,
	SYNC_MSG,
	SYNC_SEM_BY_MUTEX,
	SYNC_MUTEX_BY_SEM,
	SYNC_STRICT
} sync_mode_t;

extern int my_sync_init(sync_mode_t mode, int num_threads);
extern int my_sync_enter(sync_mode_t mode, int thread_id);
extern int my_sync_leave(sync_mode_t mode, int thread_id);
extern int my_sync_destroy(sync_mode_t mode);

/* mutexで実装した semaphore */
typedef struct {
	pthread_mutex_t mutex;
	pthread_cond_t cond;
	int value;
} my_sem_by_mutex_t;

extern int my_sem_by_mutex_init(my_sem_by_mutex_t *sem, int value);
extern int my_sem_by_mutex_wait(my_sem_by_mutex_t *sem);
extern int my_sem_by_mutex_post(my_sem_by_mutex_t *sem);
extern int my_sem_by_mutex_destroy(my_sem_by_mutex_t *sem);

/* semaphoreで実装した mutex */
typedef struct {
	my_sem_t sem;
} my_mutex_by_sem_t;

extern int my_mutex_by_sem_init(my_mutex_by_sem_t *mutex);
extern int my_mutex_by_sem_lock(my_mutex_by_sem_t *mutex);
extern int my_mutex_by_sem_unlock(my_mutex_by_sem_t *mutex);
extern int my_mutex_by_sem_destroy(my_mutex_by_sem_t *mutex);

#endif

```
\
== my_sync.c

```c
#include "my_sync.h"
#include <unistd.h>

int my_mutex_init(my_mutex_t *mutex)
{
	return pthread_mutex_init(&mutex->pmutex, NULL);
}

int my_mutex_lock(my_mutex_t *mutex)
{
	return pthread_mutex_lock(&mutex->pmutex);
}

int my_mutex_unlock(my_mutex_t *mutex)
{
	return pthread_mutex_unlock(&mutex->pmutex);
}

int my_mutex_destroy(my_mutex_t *mutex)
{
	return pthread_mutex_destroy(&mutex->pmutex);
}


int my_sem_init(my_sem_t *sem)
{
	return sem_init(&sem->psem, 0, 0);
}

int my_sem_wait(my_sem_t *sem)
{
	return sem_wait(&sem->psem);
}

int my_sem_post(my_sem_t *sem)
{
	return sem_post(&sem->psem);
}

int my_sem_destroy(my_sem_t *sem)
{
	return sem_destroy(&sem->psem);
}

static my_mutex_t g_mutex;
static my_sem_t g_sem;
static int g_msg_pipe[2];
static my_sem_by_mutex_t g_sem_by_mutex;
static my_mutex_by_sem_t g_mutex_by_sem;
static volatile int g_turn;
static int g_num_threads;

int my_sem_by_mutex_init(my_sem_by_mutex_t *sem, int value)
{
	sem->value = value;
	pthread_mutex_init(&sem->mutex, NULL);
	pthread_cond_init(&sem->cond, NULL);
	return 0;
}

int my_sem_by_mutex_wait(my_sem_by_mutex_t *sem)
{
	pthread_mutex_lock(&sem->mutex);
	while (sem->value <= 0) {
		pthread_cond_wait(&sem->cond, &sem->mutex);
	}
	sem->value--;
	pthread_mutex_unlock(&sem->mutex);
	return 0;
}

int my_sem_by_mutex_post(my_sem_by_mutex_t *sem)
{
	pthread_mutex_lock(&sem->mutex);
	sem->value++;
	pthread_cond_signal(&sem->cond);
	pthread_mutex_unlock(&sem->mutex);
	return 0;
}

int my_sem_by_mutex_destroy(my_sem_by_mutex_t *sem)
{
	pthread_cond_destroy(&sem->cond);
	pthread_mutex_destroy(&sem->mutex);
	return 0;
}

/* semaphoreを用いたmutex */

int my_mutex_by_sem_init(my_mutex_by_sem_t *mutex)
{
	my_sem_init(&mutex->sem);
	my_sem_post(&mutex->sem);
	return 0;
}

int my_mutex_by_sem_lock(my_mutex_by_sem_t *mutex)
{
	return my_sem_wait(&mutex->sem);
}

int my_mutex_by_sem_unlock(my_mutex_by_sem_t *mutex)
{
	return my_sem_post(&mutex->sem);
}

int my_mutex_by_sem_destroy(my_mutex_by_sem_t *mutex)
{
	return my_sem_destroy(&mutex->sem);
}

int my_sync_init(sync_mode_t mode, int num_threads)
{
	char token = 'T';
	g_num_threads = num_threads;
	g_turn = 0;

	switch (mode) {
	case SYNC_SEM:
		my_sem_init(&g_sem);
		my_sem_post(&g_sem);
		break;
	case SYNC_MUTEX:
		my_mutex_init(&g_mutex);
		break;
	case SYNC_MSG:
		pipe(g_msg_pipe);
		write(g_msg_pipe[1], &token, 1);
		break;
	case SYNC_SEM_BY_MUTEX:
		my_sem_by_mutex_init(&g_sem_by_mutex, 1);
		break;
	case SYNC_MUTEX_BY_SEM:
		my_mutex_by_sem_init(&g_mutex_by_sem);
		break;
	case SYNC_STRICT:
		break;
	case SYNC_NONE:
	default:
		break;
	}
	return 0;
}

int my_sync_enter(sync_mode_t mode, int thread_id)
{
	char token;

	switch (mode) {
	case SYNC_SEM:
		return my_sem_wait(&g_sem);
	case SYNC_MUTEX:
		return my_mutex_lock(&g_mutex);
	case SYNC_MSG:
		read(g_msg_pipe[0], &token, 1);
		return 0;
	case SYNC_SEM_BY_MUTEX:
		return my_sem_by_mutex_wait(&g_sem_by_mutex);
	case SYNC_MUTEX_BY_SEM:
		return my_mutex_by_sem_lock(&g_mutex_by_sem);
	case SYNC_STRICT:
		while (g_turn != thread_id) {
			/* busy wait */
		}
		return 0;
	case SYNC_NONE:
	default:
		return 0;
	}
}

int my_sync_leave(sync_mode_t mode, int thread_id)
{
	char token = 'T';

	switch (mode) {
	case SYNC_SEM:
		return my_sem_post(&g_sem);
	case SYNC_MUTEX:
		return my_mutex_unlock(&g_mutex);
	case SYNC_MSG:
		write(g_msg_pipe[1], &token, 1);
		return 0;
	case SYNC_SEM_BY_MUTEX:
		return my_sem_by_mutex_post(&g_sem_by_mutex);
	case SYNC_MUTEX_BY_SEM:
		return my_mutex_by_sem_unlock(&g_mutex_by_sem);
	case SYNC_STRICT:
		g_turn = (thread_id + 1) % g_num_threads;
		return 0;
	case SYNC_NONE:
	default:
		return 0;
	}
}

int my_sync_destroy(sync_mode_t mode)
{
	switch (mode) {
	case SYNC_SEM:
		return my_sem_destroy(&g_sem);
	case SYNC_MUTEX:
		return my_mutex_destroy(&g_mutex);
	case SYNC_MSG:
		close(g_msg_pipe[0]);
		close(g_msg_pipe[1]);
		return 0;
	case SYNC_SEM_BY_MUTEX:
		return my_sem_by_mutex_destroy(&g_sem_by_mutex);
	case SYNC_MUTEX_BY_SEM:
		return my_mutex_by_sem_destroy(&g_mutex_by_sem);
	case SYNC_STRICT:
	case SYNC_NONE:
	default:
		return 0;
	}
}
```
\