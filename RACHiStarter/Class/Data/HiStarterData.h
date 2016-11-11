//
//  HiStarterData.h
//  CocoPodsTest
//
//  Created by 刘彬彬 on 15/3/6.
//  Copyright (c) 2015年 刘彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface HiStarterData : NSObject

@property (nonatomic,strong) NSDictionary *loginDic;   //登录成功时，返回的字典信息

@property (nonatomic,assign) CGFloat autolayoutW;
@property (nonatomic,assign) CGFloat autolayoutH;

+ (HiStarterData *)sharedclassname;
@end
