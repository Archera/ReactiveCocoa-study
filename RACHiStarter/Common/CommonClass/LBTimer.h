//
//  LBTimer.h
//  RACHiStarter
//
//  Created by 刘彬彬 on 16/4/11.
//  Copyright © 2016年 刘彬彬. All rights reserved.
//

#import "HiRequestManager.h"

@interface LBTimer : HiRequestManager

+ (LBTimer *)repeatingTimerWithTimeInterval:(NSTimeInterval)seconds block:(dispatch_block_t)block;

- (void)fire;

- (void)invalidate;
@end
