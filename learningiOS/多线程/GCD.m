//
//  GCD.m
//  多线程
//
//  Created by 陈磊 on 2019/5/14.
//  Copyright © 2019 sinosoft. All rights reserved.
//

#import "GCD.h"

@implementation GCD
/*
 笔记：1.GCD的好处：
                 GCD 可用于多核的并行运算
                 GCD 会自动利用更多的 CPU 内核（比如双核、四核）
                 GCD 会自动管理线程的生命周期（创建线程、调度任务、销毁线程）
                 程序员只需要告诉 GCD 想要执行什么任务，不需要编写任何线程管理代码
 2.任务：就是执行操作的意思，换句话说就是你在线程中执行的那段代码。在 GCD 中是放在 block中的。执行任务有两种方式：同步执行（sync）和异步执行（async）。两者的主要区别是：是否等待队列的任务执行结束，以及是否具备开启新线程的能力。
     同步执行（sync）：
 
     同步添加任务到指定的队列中，在添加的任务执行结束之前，会一直等待，直到队列里面的任务完成之后再继续执行。
     只能在当前线程中执行任务，不具备开启新线程的能力。
 
 
 
     异步执行（async）：
 
     异步添加任务到指定的队列中，它不会做任何等待，可以继续执行任务。
     可以在新的线程中执行任务，具备开启新线程的能力。
 
 
     串行队列（Serial Dispatch Queue）：
 
     每次只有一个任务被执行。让任务一个接着一个地执行。（只开启一个线程，一个任务执行完毕后，再执行下一个任务）
 
 
 
     并发队列（Concurrent Dispatch Queue）：
 
     可以让多个任务并发（同时）执行。（可以开启多个线程，并且同时执行任务）并发队列的并发功能只有在异步（dispatch_async）函数下才有效
 
 
 
 
 
 疑问：
 
 */

+(void)gcdtest
{
    
/*
    
    区别                  同步(sync)                                                        异步(async)
    并发队列               没有开启新线程，串行执行任务                                          有开启新线程，并发执行任务
    串行队列               没有开启新线程，串行执行任务                                          有开启新线程(1条)，串行执行任务
    主队列                 主线程调用：死锁卡住不执行其他线程调用：没有开启新线程，串行执行任务          没有开启新线程，串行执行任务
    
    */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //串行队列
    dispatch_queue_t chuanxing = dispatch_queue_create("chuanxing", DISPATCH_QUEUE_CONCURRENT);
    /**
     主线程（其实主线程是串行队列）

     
     */
    dispatch_queue_t main = dispatch_get_main_queue();
    //并行队列
    dispatch_queue_t bingxing = dispatch_queue_create("bingxing", DISPATCH_QUEUE_SERIAL);
    
    /**
     获取全局队列（其实全局队列是并行队列）

     @param DISPATCH_QUEUE_PRIORITY_DEFAULT 队列优先级
     @param flags#> 第二个参数暂时没用，用0即可。
     */
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //串行+同步
    dispatch_sync(chuanxing, ^{
        NSLog(@"串行+同步--%@",[NSThread currentThread]);
    });
    //主队列+同步 （此时在主对列中加上同步方法的时候，那么主队列会等待block 中的方法执行 ，但是主队列中也需要等待主队列执行完成之后再执行block）
//    dispatch_sync(main, ^{
//
//        NSLog(@"主队列+同步--%@",[NSThread currentThread]);
//
//    });

    //串行+异步
    dispatch_async(chuanxing, ^{
       
        NSLog(@"串行+异步--%@",[NSThread currentThread]);
        
    });
    //主队列+异步
    dispatch_async(main, ^{
        
        NSLog(@"主队列+异步--%@",[NSThread currentThread]);
        
    });
    
    //并行+同步
    dispatch_sync(bingxing, ^{
        
        NSLog(@"并行+同步--%@",[NSThread currentThread]);
    
    });
    //全局队列+同步
    dispatch_sync(global, ^{
        
        NSLog(@"全局队列+同步--%@",[NSThread currentThread]);
        
    });
    //并行+异步
    dispatch_async(bingxing, ^{
        
        NSLog(@"并行+异步--%@",[NSThread currentThread]);
        
    });
    
    //全局队列+异步
    dispatch_async(global, ^{
        
        NSLog(@"全局队列+异步--%@",[NSThread currentThread]);
        
    });
    
    NSLog(@"--end--");
    
//    2019-05-14 15:04:12.612422+0800 多线程[28472:494318] <NSThread: 0x600003b5e900>{number = 1, name = main}
//    2019-05-14 15:04:12.612661+0800 多线程[28472:494318] <NSThread: 0x600003b5e900>{number = 1, name = main}
//    2019-05-14 15:04:12.612666+0800 多线程[28472:494531] <NSThread: 0x600003b3c300>{number = 3, name = (null)}
//    2019-05-14 15:04:12.612811+0800 多线程[28472:494531] <NSThread: 0x600003b3c300>{number = 3, name = (null)}
    
    
}
//同步+串行
-(void)tongbusync
{
    /*
    
    从同步执行 + 并发队列中可看到：
    
    所有任务都是在当前线程（主线程）中执行的，没有开启新的线程（同步执行不具备开启新线程的能力）。
    所有任务都在打印的syncConcurrent---begin和syncConcurrent---end之间执行的（同步任务需要等待队列的任务执行结束）。
    任务按顺序执行的。按顺序执行的原因：虽然并发队列可以开启多个线程，并且同时执行多个任务。但是因为本身不能创建新线程，只有当前线程这一个线程（同步任务不具备开启新线程的能力），所以也就不存在并发。而且当前线程只有等待当前队列中正在执行的任务执行完毕之后，才能继续接着执行下面的操作（同步任务需要等待队列的任务执行结束）。所以任务只能一个接一个按顺序执行，不能同时被执行。
    
    */
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"syncConcurrent---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_sync(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_sync(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    NSLog(@"syncConcurrent---end");
    /*
     
     输出结果：
     2018-02-23 20:34:55.095932+0800 YSC-GCD-demo[19892:4996930] currentThread---<NSThread: 0x60400006bbc0>{number = 1, name = main}
     2018-02-23 20:34:55.096086+0800 YSC-GCD-demo[19892:4996930] syncConcurrent---begin
     2018-02-23 20:34:57.097589+0800 YSC-GCD-demo[19892:4996930] 1---<NSThread: 0x60400006bbc0>{number = 1, name = main}
     2018-02-23 20:34:59.099100+0800 YSC-GCD-demo[19892:4996930] 1---<NSThread: 0x60400006bbc0>{number = 1, name = main}
     2018-02-23 20:35:01.099843+0800 YSC-GCD-demo[19892:4996930] 2---<NSThread: 0x60400006bbc0>{number = 1, name = main}
     2018-02-23 20:35:03.101171+0800 YSC-GCD-demo[19892:4996930] 2---<NSThread: 0x60400006bbc0>{number = 1, name = main}
     2018-02-23 20:35:05.101750+0800 YSC-GCD-demo[19892:4996930] 3---<NSThread: 0x60400006bbc0>{number = 1, name = main}
     2018-02-23 20:35:07.102414+0800 YSC-GCD-demo[19892:4996930] 3---<NSThread: 0x60400006bbc0>{number = 1, name = main}
     2018-02-23 20:35:07.102575+0800 YSC-GCD-demo[19892:4996930] syncConcurrent---end
     
     
     
     
     */
}
//异步+并发
- (void)asyncConcurrent {
    /*
     在异步执行 + 并发队列中可以看出：
     
     除了当前线程（主线程），系统又开启了3个线程，并且任务是交替/同时执行的。（异步执行具备开启新线程的能力。且并发队列可开启多个线程，同时执行多个任务）。
     所有任务是在打印的syncConcurrent---begin和syncConcurrent---end之后才执行的。说明当前线程没有等待，而是直接开启了新线程，在新线程中执行任务（异步执行不做等待，可以继续执行任务）。
     
     
     */
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncConcurrent---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_async(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    NSLog(@"asyncConcurrent---end");
    /*
     2018-02-23 20:36:41.769269+0800 YSC-GCD-demo[19929:5005237] currentThread---<NSThread: 0x604000062d80>{number = 1, name = main}
     2018-02-23 20:36:41.769496+0800 YSC-GCD-demo[19929:5005237] asyncConcurrent---begin
     2018-02-23 20:36:41.769725+0800 YSC-GCD-demo[19929:5005237] asyncConcurrent---end
     2018-02-23 20:36:43.774442+0800 YSC-GCD-demo[19929:5005566] 2---<NSThread: 0x604000266f00>{number = 5, name = (null)}
     2018-02-23 20:36:43.774440+0800 YSC-GCD-demo[19929:5005567] 3---<NSThread: 0x60000026f200>{number = 4, name = (null)}
     2018-02-23 20:36:43.774440+0800 YSC-GCD-demo[19929:5005565] 1---<NSThread: 0x600000264800>{number = 3, name = (null)}
     2018-02-23 20:36:45.779286+0800 YSC-GCD-demo[19929:5005567] 3---<NSThread: 0x60000026f200>{number = 4, name = (null)}
     2018-02-23 20:36:45.779302+0800 YSC-GCD-demo[19929:5005565] 1---<NSThread: 0x600000264800>{number = 3, name = (null)}
     2018-02-23 20:36:45.779286+0800 YSC-GCD-demo[19929:5005566] 2---<NSThread: 0x604000266f00>{number = 5, name = (null)}
     
     */
}
//同步执行 + 串行
- (void)syncSerial {
    /*
     在同步执行 + 串行队列可以看到：
     
     所有任务都是在当前线程（主线程）中执行的，并没有开启新的线程（同步执行不具备开启新线程的能力）。
     所有任务都在打印的syncConcurrent---begin和syncConcurrent---end之间执行（同步任务需要等待队列的任务执行结束）。
     任务是按顺序执行的（串行队列每次只有一个任务被执行，任务一个接一个按顺序执行）。
     
     
     */
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"syncSerial---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    dispatch_sync(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    dispatch_sync(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    NSLog(@"syncSerial---end");
    /*
     输出结果为：
     2018-02-23 20:39:37.876811+0800 YSC-GCD-demo[19975:5017162] currentThread---<NSThread: 0x604000079400>{number = 1, name = main}
     2018-02-23 20:39:37.876998+0800 YSC-GCD-demo[19975:5017162] syncSerial---begin
     2018-02-23 20:39:39.878316+0800 YSC-GCD-demo[19975:5017162] 1---<NSThread: 0x604000079400>{number = 1, name = main}
     2018-02-23 20:39:41.879829+0800 YSC-GCD-demo[19975:5017162] 1---<NSThread: 0x604000079400>{number = 1, name = main}
     2018-02-23 20:39:43.880660+0800 YSC-GCD-demo[19975:5017162] 2---<NSThread: 0x604000079400>{number = 1, name = main}
     2018-02-23 20:39:45.881265+0800 YSC-GCD-demo[19975:5017162] 2---<NSThread: 0x604000079400>{number = 1, name = main}
     2018-02-23 20:39:47.882257+0800 YSC-GCD-demo[19975:5017162] 3---<NSThread: 0x604000079400>{number = 1, name = main}
     2018-02-23 20:39:49.883008+0800 YSC-GCD-demo[19975:5017162] 3---<NSThread: 0x604000079400>{number = 1, name = main}
     2018-02-23 20:39:49.883253+0800 YSC-GCD-demo[19975:5017162] syncSerial---end
     
     
     */
}
@end
