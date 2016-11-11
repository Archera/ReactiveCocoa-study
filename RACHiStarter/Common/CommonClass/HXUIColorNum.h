//
//  HXUIColorNum.h
//  HaiXiu
//
//  Created by 刘彬彬 on 14-8-29.
//  Copyright (c) 2014年 ___HAIXIUTEAM___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXUIColorNum : NSObject
+ (UIColor *) colorFromHexRGB:(NSString *) inColorString;
+ (UIColor *) colorFromHexRGB:(NSString *) inColorString alpha:(CGFloat)colorAlpha;
@end
