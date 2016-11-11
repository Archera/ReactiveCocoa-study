//
//  LBCheckData.m
//  RACHiStarter
//
//  Created by 刘彬彬 on 15/12/30.
//  Copyright © 2015年 刘彬彬. All rights reserved.
//

#import "LBCheckData.h"

@implementation LBCheckData
+ (BOOL)checkTextField:(UITextField*)targerTfd condition:(id)condition
{
    if ([condition isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dic = (NSDictionary*)condition;
        for (id value in dic.allValues) {
            if ([self checkText:targerTfd.text condition:value]) {
            }
            else
            {
                return NO;
            }
        }
        //走到这里说明返回的全是yes，条件全部成立
        return YES;
    }
    else if ([condition isKindOfClass:[NSArray class]])
    {
        NSArray *items = (NSArray*)condition;
        for (int i = 0; i<items.count; i++) {
            id value = [items objectAtIndex:i];
            if ([self checkText:targerTfd.text condition:value]) {
            }
            else
            {
                return NO;
            }
        }
        //走到这里说明返回的全是yes，条件全部成立
        return YES;
    }
    else
    {
        return [self checkText:targerTfd.text condition:condition];
    }
}

+ (BOOL)checkText:(NSString*)targer condition:(id)condition
{
    if ([condition isKindOfClass:[NSString class]])
    {
        if ([targer isEqualToString:(NSString*)condition])
        {
            return NO;
        }
        else
        {
            return YES;
        }
    }
    else if ([condition isKindOfClass:[NSNumber class]])
    {
        if (targer.length<[(NSNumber*)condition integerValue]) {
            return NO;
        }
        else
        {
            return YES;
        }
    }
    else
    {
        return NO;
    }
}
@end
