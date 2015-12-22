//
//  ZCControl.h
//  Device
//
//  Created by ZhangCheng on 14-4-19.
//  Copyright (c) 2014年 zhangcheng. All rights reserved.
//版本说明  iOS中国开发者2群 305044955
//使用此类，在工程pch文件里面加入该头文件，即可在工程内任意地方进行创建
//此类设计模式为最简单的工厂模式
#import <Foundation/Foundation.h>

#define VIEWWIDTH  self.view.frame.size.width   //屏幕的宽度
#define VIEWHEIGHT self.view.frame.size.height  //屏幕的高度
#define CELLVIEWWIDTH self.frame.size.width     //cell的宽度
#define VIEWSTATUSHEIGHT [ZCControl isIOS7]==64?20:0  //适配要减去的状态条高度
#define IOS7   [[UIDevice currentDevice]systemVersion].floatValue>=7.0
#define IOS8   [[UIDevice currentDevice]systemVersion].floatValue>=8.0


@interface ZCControl : NSObject
#pragma mark --判断设备型号
+(NSString *)platformString;
#pragma mark --创建Label
+(UILabel*)createLabelWithFrame:(CGRect)frame Font:(int)font Text:(NSString*)text;
#pragma mark --创建View
+(UIView*)viewWithFrame:(CGRect)frame;
#pragma mark --创建imageView
+(UIImageView*)createImageViewWithFrame:(CGRect)frame ImageName:(NSString*)imageName;
#pragma mark --创建button
+(UIButton*)createButtonWithFrame:(CGRect)frame ImageName:(NSString*)imageName Target:(id)target Action:(SEL)action Title:(NSString*)title;
#pragma mark --创建UITextField
+(UITextField*)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftImageView:(UIImageView*)imageView rightImageView:(UIImageView*)rightImageView Font:(float)font;
#pragma mark  创建Segment
+(UISegmentedControl *)segmentedControlWithItems:(NSArray *)items frame:(CGRect)frame Target:(id)target Action:(SEL)action  selectedSegmentIndex:(NSInteger)index;

//适配器的方法  扩展性方法
//现有方法，已经在工程里面存在，如果修改工程内所有方法，工作量巨大，就需要使用适配器的方法
+(UITextField*)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftImageView:(UIImageView*)imageView rightImageView:(UIImageView*)rightImageView Font:(float)font backgRoundImageName:(NSString*)imageName;
#pragma mark 创建UIScrollView
+(UIScrollView*)makeScrollViewWithFrame:(CGRect)frame andSize:(CGSize)size;
#pragma mark 创建UIPageControl
+(UIPageControl*)makePageControlWithFram:(CGRect)frame;
#pragma mark 创建UISlider
+(UISlider*)makeSliderWithFrame:(CGRect)rect AndImage:(UIImage*)image;
#pragma mark 创建时间转换字符串
+(NSString *)stringFromDateWithHourAndMinute:(NSDate *)date;
#pragma mark --判断导航的高度64or44
+(float)isIOS7;

#pragma mark 内涵图需要的方法
+ (NSString *)stringDateWithTimeInterval:(NSString *)timeInterval;

+ (CGFloat)textHeightWithString:(NSString *)text width:(CGFloat)width fontSize:(NSInteger)fontSize;

+ (NSString *)addOneByIntegerString:(NSString *)integerString;

#pragma mark 16进制颜色转换 格式：@"#ffffff"
+(UIColor *)colorWirhNSString:(NSString *)colorString;

#pragma mark 转换颜色  格式：@"0xF3,0x2D,0x63"
+(UIColor *)convertHexadecimalColor:(NSString *)colorString;

#pragma mark 字符串高度判断
+(CGSize)stringWithString:(NSString *)str withFont:(NSInteger)num withMaxSize:(CGSize)maxSize;

#pragma mark 手机号码验证
+(BOOL)isValidateMobile:(NSString *)mobile;
#pragma mark 邮箱验证 
+(BOOL)isValidateEmail:(NSString *)email;
#pragma mark 中文判断
+ (BOOL)isValidateChinese:(NSString *)chinese;
#pragma mark 检测字符串是否为空或全为空格;
+(BOOL)textIsAllSpace:(NSString *)text;


#pragma mark 图片超过屏幕宽度则图片按比例缩放（宽为屏幕宽度），不超过屏幕宽度时，按原图大小 width图片最大宽度
+(CGSize)imageWithScalingImageSize:(CGSize)size withWidth:(CGFloat)width;

#pragma mark 补充 用下面的代码 把图片穿进去,你的 imageView 的 size 传进去 自动等比例缩放.
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;
@end
