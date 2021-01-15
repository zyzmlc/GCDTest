//
//  ViewController.m
//  GCDTest
//
//  Created by 小冬 on 2021/1/13.
//  Copyright © 2021 小冬. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic , assign) NSInteger a;

@property (strong, nonatomic) NSObject *object;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.object = [[NSObject alloc] init];
    // Do any additional setup after loading the view.
    //        [self printOne];
    
    self.a = 0;
    
    [self printThree];

    
}

// 方法一：串行执行
- (void)printOne{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    for (int i = 0; i < 100; i ++ ) {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        
        dispatch_queue_t q = dispatch_get_global_queue(0, 0);
        dispatch_async( q, ^{
            sleep(0.1);
            NSLog(@"%d, i=%d, 余数=%d", [[NSThread currentThread] isMainThread], i, i%10);
            dispatch_semaphore_signal(semaphore);
        });
    }
}

# pragma mark - 方法二
- (void)printThree{
    
    // 控制最大并发数
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(10);
    for (int i = 0; i < 100; i ++ ) {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        
        dispatch_queue_t q = dispatch_get_global_queue(0, 0);
        
        
        if (self.a % 10 == 0) {
            dispatch_async( q, ^{
                sleep(0.1);
                NSLog(@"%d, i=%d, 余数=%d a = %zd", [[NSThread currentThread] isMainThread], i, i%10, self.a);
                [self jianfa];
                dispatch_semaphore_signal(semaphore);
            });
        }
        
        
        if (self.a % 10 == 1) {
            dispatch_async( q, ^{
                sleep(0.1);
                NSLog(@"%d, i=%d, 余数=%d a = %zd", [[NSThread currentThread] isMainThread], i, i%10, self.a);
                [self jianfa];
                dispatch_semaphore_signal(semaphore);
            });
        }
        
        if (self.a % 10 == 2) {
            dispatch_async( q, ^{
                sleep(0.1);
                NSLog(@"%d, i=%d, 余数=%d a = %zd", [[NSThread currentThread] isMainThread], i, i%10, self.a);
                [self jianfa];
                dispatch_semaphore_signal(semaphore);
            });
        }
        
        if (self.a % 10 == 3) {
            dispatch_async( q, ^{
                sleep(0.1);
                NSLog(@"%d, i=%d, 余数=%d a = %zd", [[NSThread currentThread] isMainThread], i, i%10, self.a);
                [self jianfa];
                dispatch_semaphore_signal(semaphore);
            });
        }
        
        if (self.a % 10 == 4) {
            dispatch_async( q, ^{
                sleep(0.1);
                NSLog(@"%d, i=%d, 余数=%d a = %zd", [[NSThread currentThread] isMainThread], i, i%10, self.a);
                [self jianfa];
                dispatch_semaphore_signal(semaphore);
            });
        }
        
        if (self.a % 10 == 5) {
            dispatch_async( q, ^{
                sleep(0.1);
                NSLog(@"%d, i=%d, 余数=%d a = %zd", [[NSThread currentThread] isMainThread], i, i%10, self.a);
                [self jianfa];
                dispatch_semaphore_signal(semaphore);
            });
        }
        
        
        if (self.a % 10 == 6) {
            dispatch_async( q, ^{
                sleep(0.1);
                NSLog(@"%d, i=%d, 余数=%d a = %zd", [[NSThread currentThread] isMainThread], i, i%10, self.a);
                [self jianfa];
                dispatch_semaphore_signal(semaphore);
            });
        }
        
        if (self.a % 10 == 7) {
            dispatch_async( q, ^{
                sleep(0.1);
                NSLog(@"%d, i=%d, 余数=%d a = %zd", [[NSThread currentThread] isMainThread], i, i%10, self.a);
                [self jianfa];
                dispatch_semaphore_signal(semaphore);
            });
        }
        
        if (self.a % 10 == 8) {
            dispatch_async( q, ^{
                sleep(0.1);
                NSLog(@"%d, i=%d, 余数=%d a = %zd", [[NSThread currentThread] isMainThread], i, i%10, self.a);
                [self jianfa];
                dispatch_semaphore_signal(semaphore);
            });
        }
        
        if (self.a % 10 == 9) {
            dispatch_async( q, ^{
                sleep(0.1);
                NSLog(@"%d, i=%d, 余数=%d a = %zd", [[NSThread currentThread] isMainThread], i, i%10, self.a);
                dispatch_semaphore_signal(semaphore);
                [self jianfa];
            });
        }
    }
}

// 控制资源加锁
- (void)jianfa{
    @synchronized (self.object) {
        self.a ++;
    }
}
@end
