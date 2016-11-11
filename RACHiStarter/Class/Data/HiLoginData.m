//
//  HiLoginData.m
//  HistarterProject
//
//  Created by 刘彬彬 on 15/1/30.
//  Copyright (c) 2015年 刘彬彬. All rights reserved.
//

#import "HiLoginData.h"

@implementation HiLoginData
static HiLoginData *sharedclassname = nil;
@synthesize userAccount,userSec;
+ (HiLoginData *)sharedclassname
{
    @synchronized(self)
    {
        if (sharedclassname == nil)
        {
            sharedclassname = [[self alloc] init];
            sharedclassname.userIsLogin = NO;
            sharedclassname.userLoginSuccess = NO;
            sharedclassname.loginToken = @"";
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
