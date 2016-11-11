//
//  HiStarterData.m
//  CocoPodsTest
//
//  Created by 刘彬彬 on 15/3/6.
//  Copyright (c) 2015年 刘彬彬. All rights reserved.
//

#import "HiStarterData.h"

@implementation HiStarterData
@synthesize loginDic;
static HiStarterData *sharedclassname = nil;
+ (HiStarterData *)sharedclassname
{
    @synchronized(self)
    {
        if (sharedclassname == nil)
        {
            sharedclassname = [[self alloc] init];
            sharedclassname.loginDic = [NSDictionary dictionary];
            
            if (SCREEN_WIDTH<414) {
                sharedclassname.autolayoutW = SCREEN_WIDTH/375;
                sharedclassname.autolayoutH = SCREEN_HEIGHT/667;
            }
            else
            {
                sharedclassname.autolayoutW = 1;
                sharedclassname.autolayoutH = 1;
            }
        }
    }
    return sharedclassname;
}

//当选择受损部位页面出现时清空缓存
- (void)clearData
{
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (sharedclassname == nil)
        {
            sharedclassname = [super allocWithZone:zone];
            return sharedclassname;
        }
    }
    
    return nil;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}
@end
