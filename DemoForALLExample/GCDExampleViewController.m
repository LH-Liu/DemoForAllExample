//
//  GCDExampleViewController.m
//  DemoForALLExample
//
//  Created by LH_Liu on 2017/10/20.
//  Copyright © 2017年 com.zhangyuan. All rights reserved.
//

#import "GCDExampleViewController.h"

@interface GCDExampleViewController ()

@end

@implementation GCDExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self DispatchGroup];
    // Do any additional setup after loading the view.
}


/**
 dispatch group
 */
- (void)DispatchGroup{
    dispatch_queue_t queue = dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"GCD1");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"CGD2");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"CGD3");
        
    });
    
    //group中的所有任务结束后，才开始执行这里的任务，group执行完以后才能把任务加入主队列
    dispatch_group_notify(group, queue, ^{
        NSLog(@"Notify done");
    });
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1ull * NSEC_PER_SEC);
    //这个函数用于判断经过指定时间以后，group里面的任务是否完成，如果完成，返回0，如果不等于0，则是没有完成。
    //这里的等待的意思是，当前线程会处于阻塞状态且dispatch_group_wait方法处于调用状态，知道group任务完成或者指定时间结束。
    long result = dispatch_group_wait(group, time);
    
    if (result == 0) {
        //属于Dispatch Group 的全部处理执行结束
        NSLog(@"属于Dispatch Group 的全部处理、执行结束");
        
    }else{
        //属于dispatch Group 的有处理没执行结束
        NSLog(@"属于dispatch Group 的有处理没执行结束");
        
    }
}


@end
