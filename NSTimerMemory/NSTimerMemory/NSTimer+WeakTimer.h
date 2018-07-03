//
//  NSTimer+WeakTimer.h
//  NSTimerMemory
//
//  Created by jason on 2018/7/3.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (WeakTimer)

+ (NSTimer *)scheduledWeakTimerWithTimeInterval:(NSTimeInterval)interval
                                         target:(id)aTarget
                                        seletor:(SEL)aSelector
                                      userinfor:(id)userInfo
                                        repeats:(BOOL)repeats;
@end
