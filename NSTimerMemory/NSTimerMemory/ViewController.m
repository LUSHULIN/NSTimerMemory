//
//  ViewController.m
//  NSTimerMemory
//
//  Created by jason on 2018/7/3.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "ViewController.h"
#import "NSTimer+WeakTimer.h"

@interface ViewController () {
    NSTimer *timer;
    NSUInteger number;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    timer = [NSTimer scheduledWeakTimerWithTimeInterval:1 target:self seletor:@selector(print) userinfor:nil repeats:true];
    [timer fire];
}

- (void)print {
    if (number == 5) {
        [timer invalidate];
    } else {
        NSLog(@"print method");
        number ++;
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
