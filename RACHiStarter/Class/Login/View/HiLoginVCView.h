//
//  HiLoginVCView.h
//  RACHiStarter
//
//  Created by 刘彬彬 on 15/11/17.
//  Copyright © 2015年 刘彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^HiLoginEventBlock)(NSInteger tag);
@interface HiLoginVCView : UIView<UITextFieldDelegate>
@property (strong, nonatomic) UITextField *accountTfd;

@property (strong, nonatomic) UITextField *secureTfd;

@property (nonatomic, strong) UIButton *loginBtn;

@property (nonatomic, strong) UIButton *registerBtn;

@property (nonatomic, strong) UIButton *forgetPasswordBtn;

@property (nonatomic, strong) UIImageView *loginBackground;

@property (nonatomic ,strong) HiLoginEventBlock switchController_;
@end
