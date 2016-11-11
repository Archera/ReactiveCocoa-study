//
//  HiRegisterView.h
//  RACHiStarter
//
//  Created by 刘彬彬 on 16/3/18.
//  Copyright © 2016年 刘彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HiRegisterView : UIView <UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *registerBackground;
@property (nonatomic, strong) UITextField *account;//账号
@property (nonatomic, strong) UITextField *verificationCode;//验证码
@property (nonatomic, strong) UITextField *password;//密码
@property (nonatomic, strong) UIButton *finishedBtn;
@property (nonatomic, strong) UIButton *verificationCodeBtn;

- (void)daojishi;
@end
