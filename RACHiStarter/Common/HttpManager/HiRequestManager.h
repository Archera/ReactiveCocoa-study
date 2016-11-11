//
//  HiRequestManager.h
//  RACHiStarter
//
//  Created by 刘彬彬 on 16/1/5.
//  Copyright © 2016年 刘彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HiHttpManager.h"
@interface HiRequestManager : NSObject
@property (nonatomic,assign) BOOL requestHttpFinished;

/**
 *  判断是否登录
 */
- (BOOL)checkIsLogin;

/**
 *  校验str的合法性
 *
 *  @param currentStr 被校验的str
 *  @param errorStr   校验不合格后返回给用户看的说明内容
 *
 *  @return 返回校验后的str
 */
- (NSString*)checkNull:(NSString*)currentStr withReturnStr:(NSString*)errorStr;

/**
 *  发送请求
 *
 *  @param sendDic  发送的数据
 *  @param httpType 请求接口
 */
- (void)requestHttp:(NSDictionary*)sendDic withType:(HttpRequestType)httpType;

//请求成功，返回数据
- (void)returnDictionary:(NSDictionary*)dic;

//返回请求类型(接口)
- (void)returnType:(HttpRequestType)httpType;

/**
 *  请求失败,在这里处理UI上的变化
 */
- (void)returnFailure;
@end
