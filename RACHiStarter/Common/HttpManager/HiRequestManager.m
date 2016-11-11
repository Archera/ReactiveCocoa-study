//
//  HiRequestManager.m
//  RACHiStarter
//
//  Created by 刘彬彬 on 16/1/5.
//  Copyright © 2016年 刘彬彬. All rights reserved.
//

#import "HiRequestManager.h"
#import "HiLoginVC.h"
@implementation HiRequestManager

/**
 *  判断是否登录
 */
- (BOOL)checkIsLogin
{
    if (![HiLoginData sharedclassname].userLoginSuccess)
    {
        HiLoginVC *vc = [[HiLoginVC alloc] init];
//        [self.navigationController pushViewController:vc animated:NO];
        return NO;
    }
    else
    {
        return YES;
    }
}

/**
 *  校验str的合法性
 *
 *  @param currentStr 被校验的str
 *  @param errorStr   校验不合格后返回给用户看的说明内容
 *
 *  @return 返回校验后的str
 */
- (NSString*)checkNull:(NSString*)currentStr withReturnStr:(NSString*)errorStr
{
    NSString *zwms = [NSString stringWithFormat:@"%@",currentStr];
    if ([zwms isEqualToString:@""]||[zwms isEqualToString:@"<null>"]||[zwms isEqualToString:@"(null)"]) {
        if ([errorStr isEqualToString:@""]) {
            errorStr = @"暂无信息";
        }
        zwms = errorStr;
    }
    return zwms;
}

#pragma mark -- http
- (void)requestHttp:(NSDictionary*)sendDic withType:(HttpRequestType)httpType
{
    WS(contro);
    [[HiHttpManager sharedInstance] sendPostHttp:httpType
                                          params:sendDic
                                         success:^(NSDictionary * response)
     {
         self.requestHttpFinished = YES;
         [contro returnType:httpType];
         NSString *str = [NSString stringWithFormat:@"%@",[response objectForKey:@"success"]];
         if ([@"1" isEqualToString:str])
         {
             [contro returnDictionary:response];
         }
         else
         {
             ULog(@"%@",[response objectForKey:@"message"]);
         }
         
     }
                                         failure:^(NSError *error, NSInteger statusCode)
     {
         if (statusCode == 0) {
             [contro returnFailure];
         }
#ifdef DEBUG
         ULog(@"error is %@; statusCode is %ld",error, (long)statusCode);
#else
         if (error.code == -1004) {
             [GlobalUtils alert:@"网络连接失败，请检查网络。"];
         }
         else if (error.code == -1001){
             [GlobalUtils alert:@"服务器繁忙，请稍后在试。"];
         }
#endif
     }];
}
- (void)returnType:(HttpRequestType)httpType
{}
- (void)returnDictionary:(NSDictionary*)dic
{
}

- (void)returnFailure
{
}
@end
