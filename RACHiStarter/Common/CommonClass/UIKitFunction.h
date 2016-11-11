//
//  UIKitFunction.h
//  SmartHome
//
//  Created by liubinbin on 14-8-15.
//  Copyright (c) 2014年 Het. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kLabelTag       10111

@interface UIKitFunction : NSObject
+ (CGRect)autoSizeScaleFrame:(CGRect)rect_;
+ (UIButton*)buildLabelBtn:(CGRect)frame_
                 withTitle:(NSString*)btnTitle_
                   withTag:(int)tag_
            withTitleColor:(UIColor*)color_
                 withImage:(UIImage*)image_;
+ (UIButton*)buildBtn:(CGRect)frame_ withTitle:(NSString*)btnTitle_ withTag:(int)tag_ withTitleColor:(UIColor*)color_ withImage:(UIImage*)image_;
+ (UILabel*)buildLabel:(CGRect)rect_ withTitle:(NSString*)str_ withTextColor:(UIColor*)color_ withTextFont:(CGFloat)fontFloat;
+ (UILabel*)buildLabel:(CGRect)rect_
             withTitle:(NSString*)str_
         withTextColor:(UIColor*)color_
          withTextFont:(CGFloat)fontFloat
        withLineNumber:(int)linNum;
+ (UILabel*)buildLabelNosizeToFit:(CGRect)rect_
                        withTitle:(NSString*)str_
                    withTextColor:(UIColor*)color_
                     withTextFont:(CGFloat)fontFloat;
+ (UIImageView*)buildImageView:(CGRect)rect_ withImageName:(NSString*)image_;
+ (UIImageView*)buildImageView:(CGRect)rect_ withImage:(UIImage*)image_;
+ (UITextField *)buildTextField:(CGRect)rect_ withPlaceholder:(NSString*)str_ isSecure:(BOOL)sure_ withFont:(CGFloat)num_;
+ (CGSize)lineSizeLblWithStr:(NSString*)str withFont:(UIFont*)font_;
+ (CGSize)lineSizeLblWithStr:(NSString*)str withFont:(UIFont*)font_ withWight:(CGFloat)hei;

+ (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize;
/**
 *  自定义label的行间距和字间距
 *
 *  @param targer            目标string
 *  @param line_             目标行间距
 *  @param characterSpacing_ 目标字间距
 *
 *  @return 返回处理后的string
 */
+ (NSString*)stringFreeFrameTargerString:(NSString*)targer
                     withTargerLineSpace:(long)line_
                withTargerCharacterSpace:(CGFloat)characterSpacing_;
+ (UIScrollView*)scrollViewFrame:(CGRect)rect_ withSize:(CGSize)frame_ withPage:(BOOL)isPage;
//遮罩阴影view
+ (UIView*)addAlphView:(CGRect)rect_ withAlpha:(CGFloat)alpha_;
+ (void) startRotationAnimation:(CALayer*)layer_;
//开始动画
+ (void)startCGAnimation:(UIView*)view_ withAngle:(float)angle_;
//停止动画
+ (void)resumeAnimation:(CALayer*)layer_;
+ (void)showPopWithPopButton:(UIButton *)aButton showPosition:(CGRect)aRect;
+ (void)rotationDeg:(CALayer*)layer_ withDeg:(CGFloat)deg;
+ (NSString*)phpTimeToObj:(NSString*)strTime;
+ (id)isObjectDic:(NSDictionary*)objDic contentTheKey:(NSString*)objKey_;
#define IS_IOS_7 DeviceSystemMajorVersion()
NSUInteger DeviceSystemMajorVersion();
+ (NSString *)intervalSinceNow: (NSString *) theDate;
/**
 *  NSDate 转成年月日string
 */
+ (NSString*)NSDateToNSString:(NSDate*)DateTime;
/**
 *  yyyy-MM-dd HH:mm
 */
+ (NSString*)dateToCompleteString:(NSDate*)DateTime;
@end
