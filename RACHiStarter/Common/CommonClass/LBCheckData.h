//
//  LBCheckData.h
//  RACHiStarter
//
//  Created by 刘彬彬 on 15/12/30.
//  Copyright © 2015年 刘彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBCheckData : NSObject
/**
 *  check UITextField 内容的合法性
 *
 *  @param targerTfd UITextField.text
 *  @param condition 检查的条件或条件集合@[NSString,NSNumber]
 */
+ (BOOL)checkTextField:(UITextField*)targerTfd condition:(id)condition;

/**
 *  check NSString 内容的合法性
 *
 *  @param targer    targerTfd UITextField.text
 *  @param condition 检查的条件
 */
+ (BOOL)checkText:(NSString*)targer condition:(id)condition;
@end
