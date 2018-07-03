//
//  NSTimer+WeakTimer.m
//  NSTimerMemory
//
//  Created by jason on 2018/7/3.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "NSTimer+WeakTimer.h"

@interface TimerWeakObject:NSObject

@property (nonatomic,weak) id target;
@property (nonatomic,assign) SEL selector;
@property (nonatomic,weak) NSTimer *timer;

- (void)fire:(NSTimer *)timer;

@end

@implementation TimerWeakObject
- (void)fire:(NSTimer *)timer {
    if (self.target) {
        if ([self.target respondsToSelector:self.selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored   "-Warc-performSelector-leaks"
            [self.target performSelector:self.selector withObject:timer.userInfo];
#pragma clang diagnostic pop
           
        }
    } else {
        [self.timer invalidate];
    }
}


@end


@implementation NSTimer (WeakTimer)

+ (NSTimer *)scheduledWeakTimerWithTimeInterval:(NSTimeInterval)interval target:(id)aTarget seletor:(SEL)aSelector userinfor:(id)userInfo repeats:(BOOL)repeats {
    
    TimerWeakObject *object = [[TimerWeakObject alloc] init];
    object.target = aTarget;
    object.selector = aSelector;
    object.timer = [NSTimer scheduledTimerWithTimeInterval:interval target:aTarget selector:aSelector userInfo:userInfo repeats:repeats];
    return object.timer;
}

@end
