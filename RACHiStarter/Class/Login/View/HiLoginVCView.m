//
//  HiLoginVCView.m
//  RACHiStarter
//
//  Created by 刘彬彬 on 15/11/17.
//  Copyright © 2015年 刘彬彬. All rights reserved.
//

#import "HiLoginVCView.h"

@implementation HiLoginVCView
@synthesize accountTfd,secureTfd,loginBtn,loginBackground,registerBtn,forgetPasswordBtn;
+ (instancetype)buildStart
{
    return [super init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        [self buildLoginBackground];
        [self buildAccount];
        [self buildPassword];
        [self buildLoginBtn];
        [self buildRegisterBtn];
    }
    return self;
}

- (void)event:(UIButton*)sender
{
    self.switchController_(sender.tag);
}

#pragma mark -- private methods

- (void)addLineViewSuperView:(UIView*)superView
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(OBJECT_WIDTH(35), CGRectGetMaxY(superView.frame)+OBJECT_HEIGHT(10), OBJECT_WIDTH(300), 0.5)];
    [line setBackgroundColor:[HXUIColorNum colorFromHexRGB:@"bfbfbf"]];
    [self addSubview:line];
}

#pragma mark -- getters and setters or buildview

- (void)buildLoginBackground
{
    if (!loginBackground)
    {
        loginBackground = [[UIImageView alloc] initWithFrame:self.bounds];
        loginBackground.image = [UIImage imageNamed:@"HiLoginBackground"];
        [self addSubview:loginBackground];
    }
}

- (void)buildAccount
{
    if (!accountTfd)
    {
        accountTfd = [UIKitFunction buildTextField:CGRectMake(OBJECT_WIDTH(35), OBJECT_HEIGHT(220), OBJECT_WIDTH(300), OBJECT_HEIGHT(20)) withPlaceholder:@"手机号码或邮箱地址" isSecure:NO withFont:17.0f];
        accountTfd.delegate = self;
        accountTfd.text = @"1062454152@qq.com";
        accountTfd.font = SYSTEM_Normal_font(17.0f);
        [self addSubview:accountTfd];
        
        [self addLineViewSuperView:accountTfd];
    }
}

- (void)buildPassword
{
    if (!secureTfd)
    {
        secureTfd = [UIKitFunction buildTextField:CGRectMake(OBJECT_WIDTH(35), OBJECT_HEIGHT(30)+CGRectGetMaxY(accountTfd.frame), OBJECT_WIDTH(300), OBJECT_HEIGHT(20)) withPlaceholder:@"密码" isSecure:YES withFont:17.0f];
        secureTfd.delegate = self;
        secureTfd.text = @"1234567";
        secureTfd.font = SYSTEM_Normal_font(17.0f);
        [self addSubview:secureTfd];
        
        [self addLineViewSuperView:secureTfd];
    }
}

- (void)buildLoginBtn
{
    //btn的高度*GlobalautolayoutH
    if (!loginBtn)
    {
        UIImage *btnImage = [UIImage imageNamed:@"HiLoginImage03"];
        loginBtn = [UIKitFunction buildBtn:CGRectMake(OBJECT_WIDTH(35), OBJECT_HEIGHT(30)+CGRectGetMaxY(secureTfd.frame), OBJECT_WIDTH(300), btnImage.size.height*GlobalautolayoutH) withTitle:@"" withTag:0 withTitleColor:nil withImage:btnImage];
        [self addSubview:loginBtn];
    }
}

- (void)buildRegisterBtn
{
    if (!registerBtn)
    {
//        UIImage *registerImage = [UIImage imageNamed:@"registerBtn"];
        registerBtn = [UIKitFunction buildBtn:CGRectMake(50, 500, 100, 100) withTitle:@"注册账号" withTag:0 withTitleColor:[UIColor redColor] withImage:nil];
        [registerBtn addTarget:self action:@selector(event:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:registerBtn];
    }
}

- (void)buildforgetPasswordBtn
{
    if (!forgetPasswordBtn)
    {
//        UIImage *forgetPasswordImage = [UIImage imageNamed:@"forgetPasswordBtn"];
        forgetPasswordBtn = [UIKitFunction buildBtn:CGRectMake(SCREEN_WIDTH-150, 500, 100, 100) withTitle:@"忘记密码" withTag:0 withTitleColor:[UIColor redColor] withImage:nil];
        [self addSubview:forgetPasswordBtn];
    }
}
@end
