//
//  LBTimer.m
//  RACHiStarter
//
//  Created by 刘彬彬 on 16/4/11.
//  Copyright © 2016年 刘彬彬. All rights reserved.
//

#import "LBTimer.h"
@interface LBTimer ()
@property (nonatomic, readwrite, copy) dispatch_block_t block;
@property (nonatomic, readwrite, strong) dispatch_source_t source;
@end

@implementation LBTimer
@synthesize block = _block;
@synthesize source = _source;

+ (LBTimer *)repeatingTimerWithTimeInterval:(NSTimeInterval)seconds block:(dispatch_block_t)block
{
    NSParameterAssert(seconds);
    NSParameterAssert(block);
    
    LBTimer *timer = [[self alloc] init];
    timer.block = block;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    timer.source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,0, 0,queue);
    
    dispatch_source_set_timer(timer.source, dispatch_walltime(NULL, 0), seconds * NSEC_PER_SEC, 0); //每秒执行
    
//    uint64_t nsec = (uint64_t)(seconds * NSEC_PER_SEC);
//    dispatch_source_set_timer(timer.source,
//                              dispatch_time(DISPATCH_TIME_NOW, nsec),
//                              nsec, 0);
    dispatch_source_set_event_handler(timer.source, block);
    dispatch_resume(timer.source);
    return timer;
}

- (void)invalidate {
    if (self.source) {
        dispatch_source_cancel(self.source);
        self.source = nil;
    }
    self.block = nil;
}

- (void)dealloc {
    [self invalidate];
}

- (void)fire {
    self.block();
}
@end
