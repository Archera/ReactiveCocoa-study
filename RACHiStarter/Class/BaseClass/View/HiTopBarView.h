//
//  HiTopBarView.h
//  RACHiStarter
//
//  Created by 刘彬彬 on 16/2/2.
//  Copyright © 2016年 刘彬彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HiTopBarView : UIView
@property (nonatomic,strong) UIButton *rightBtn;
@property (nonatomic,strong) UIButton *leftBtn;
@property (nonatomic,strong) UILabel  *titleLbl;

/**
 *  隐藏右边按钮
 *
 *  @param isHide 默认no
 */
- (void)hideRightBtn:(BOOL)isHide;

/**
 *  隐藏左边按钮
 *
 *  @param isHide 默认no
 */
- (void)hideLeftBtn:(BOOL)isHide;

/**
 *  设置右边按钮图片
 *
 *  @param image_ image
 */
- (void)setRightImage:(UIImage*)image_;

/**
 *  设置左边按钮图片
 *
 *  @param image_ image
 */
- (void)setLeftImage:(UIImage*)image_;

/**
 *  设置bar的颜色
 *
 *  @param image image
 */
//- (void)setBarimage:(UIImage*)image;

- (instancetype)initWithFrame:(CGRect)frame topTitle:(NSString *)topText leftImage:(UIImage *)leftImage rightImage:(UIImage *)rightImage;
@end
