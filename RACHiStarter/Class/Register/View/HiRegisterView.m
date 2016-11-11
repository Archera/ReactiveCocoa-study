//
//  HiRegisterView.m
//  RACHiStarter
//
//  Created by 刘彬彬 on 16/3/18.
//  Copyright © 2016年 刘彬彬. All rights reserved.
//

#import "HiRegisterView.h"

@interface HiRegisterView ()
{
    NSInteger timerCount;
    NSTimer *timer;
}
@end

@implementation HiRegisterView
@synthesize registerBackground,account,verificationCode,password,finishedBtn,verificationCodeBtn;

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        timerCount = 60;
        [self buildRegisterBackground];
        [self buildAccount];
        [self buildVerificationCode];
        [self buildPassword];
        [self buildLoginBtn];
    }
    return self;
}

#pragma mark -- private methods
- (void)addLineViewSuperView:(UIView*)superView
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(35*(SCREEN_WIDTH/375), CGRectGetMaxY(superView.frame)+10*(SCREEN_HEIGHT/667), 300*(SCREEN_WIDTH/375), 0.5)];
    [line setBackgroundColor:[HXUIColorNum colorFromHexRGB:@"bfbfbf"]];
    [self addSubview:line];
}

- (void)daojishi
{
    [self.verificationCodeBtn setBackgroundColor:[HXUIColorNum colorFromHexRGB:@"c5c5c5"]];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(XXX) userInfo:nil repeats:YES];
    [timer fire];
}

- (void)XXX
{
    if (timerCount!=0) {
        verificationCodeBtn.userInteractionEnabled = NO;
        timerCount --;
        [verificationCodeBtn setTitle:[NSString stringWithFormat:@"%lu秒后重发",(unsigned long)timerCount] forState:UIControlStateNormal];
    }
    else
    {
        [timer invalidate];
        timer = nil;
        [verificationCodeBtn setBackgroundColor:[HXUIColorNum colorFromHexRGB:@"1686da"]];
        [verificationCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        verificationCodeBtn.userInteractionEnabled = YES;
        timerCount = 59;
    }
}

#pragma mark -- getters and setters or buildview
/**
 *  背景图片
 */
- (void)buildRegisterBackground
{
    if (!registerBackground) {
        registerBackground = [[UIImageView alloc] initWithFrame:self.bounds];
        registerBackground.image = [UIImage imageNamed:@"HiLoginBackground"];
        [self addSubview:registerBackground];
    }
}

/**
 *  注册账号
 */
- (void)buildAccount
{
    if (!account) {
        account = [UIKitFunction buildTextField:CGRectMake(35*(SCREEN_WIDTH/375), 220*(SCREEN_HEIGHT/667), 300*(SCREEN_WIDTH/375), 17) withPlaceholder:@"请输入手机号码" isSecure:NO withFont:17.0f];
        account.font = SOURCEHAN_Normal_FONT(17.0f);
        account.delegate = self;
        [self addSubview:account];
        
        [self addLineViewSuperView:account];
    }
}

/**
 *  验证码
 */
- (void)buildVerificationCode
{
    if (!verificationCode) {
        verificationCode = [UIKitFunction buildTextField:CGRectMake(35*(SCREEN_WIDTH/375), 30*(SCREEN_HEIGHT/667)+CGRectGetMaxY(account.frame), 190*(SCREEN_WIDTH/375), 17) withPlaceholder:@"请输入验证码" isSecure:NO withFont:17.0f];
        verificationCode.delegate = self;
        verificationCode.font = SOURCEHAN_Normal_FONT(17.0f);
        [self addSubview:verificationCode];
        
        [self addLineViewSuperView:verificationCode];
    }
    
    if (!verificationCodeBtn) {
        CGRect rect_ = CGRectMake(35*(SCREEN_WIDTH/375), CGRectGetMaxY(account.frame)+10*(SCREEN_HEIGHT/667), 300*(SCREEN_WIDTH/375), 0.5);
        verificationCodeBtn = [UIKitFunction buildBtn:CGRectMake(CGRectGetMaxX(rect_)-106*(SCREEN_WIDTH/375), CGRectGetMaxY(rect_)+6*(SCREEN_HEIGHT/667), 106*(SCREEN_WIDTH/375), 32.5*(SCREEN_HEIGHT/667)) withTitle:@"获取验证码" withTag:0 withTitleColor:[UIColor whiteColor] withImage:nil];
        verificationCodeBtn.layer.cornerRadius = 4.0;
        verificationCodeBtn.layer.masksToBounds = YES;
        [verificationCodeBtn setBackgroundColor:[HXUIColorNum colorFromHexRGB:@"1686da"]];
        verificationCodeBtn.titleLabel.font = SOURCEHAN_Normal_FONT(15.0);
        [self addSubview:verificationCodeBtn];
    }
}

/**
 *  注册密码
 */
- (void)buildPassword
{
    if (!password) {
        password = [UIKitFunction buildTextField:CGRectMake(35*(SCREEN_WIDTH/375), 30*(SCREEN_HEIGHT/667)+CGRectGetMaxY(verificationCode.frame), 300*(SCREEN_WIDTH/375), 17) withPlaceholder:@"请输入密码" isSecure:YES withFont:17.0f];
        password.font = SYSTEM_Normal_font(17.0f);
        password.delegate = self;
        [self addSubview:password];
        
        [self addLineViewSuperView:password];
    }
}

/**
 *  注册按钮
 */
- (void)buildLoginBtn
{
    //btn的高度*GlobalautolayoutH
    if (!finishedBtn) {
        UIImage *btnImage = [UIImage imageNamed:@""];
        finishedBtn = [UIKitFunction buildBtn:CGRectMake(35*(SCREEN_WIDTH/375), 30*(SCREEN_HEIGHT/667)+CGRectGetMaxY(password.frame), 300*(SCREEN_WIDTH/375), btnImage.size.height*GlobalautolayoutH) withTitle:@"" withTag:0 withTitleColor:nil withImage:btnImage];
        [self addSubview:finishedBtn];
    }
}
@end
