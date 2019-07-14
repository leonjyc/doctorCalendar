//
//  Util.h
//  XT
//
//  Created by Leon.
//  Copyright (c) 2018年 CSHL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Category.h"
#import "AppDelegate.h"

@interface XTUtil : NSObject

//获取设备uuid
+(NSString *)getCurrentDeviceUUID;
// system
+ (BOOL)isIphoneFour; //是否3.5寸屏

+ (CGFloat)getScreenScale;

// 系统版本
+ (float)systemVersion;

// app 版本
+ (NSString *)appVersion;

// 屏幕高度 宽度 不是以像素计的
+ (float)screenWidth;
+ (float)screenHeight;
+ (CGFloat)statusBarHeight;

// 获取系统时间戳
+ (NSString *)getTimeStamp;

+ (NSString *)getCachePath:(NSString *)url andParams:(NSDictionary *)dic;
+ (void)cleanCache;
- (float )folderSizeAtPath:(NSString*) folderPath;

// 获取cache 根目录
+ (NSString *)getDocumentRootPath;

// 通过颜色获取image
+ (UIImage *)imageWithColor:(UIColor *)color;

// 通过颜色获取指定大小 image
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(float)alpha;

+ (UIWindow *)window;

+ (id)findSubViewOfClass:(id)cls inView:(UIView *)view;

//检查字符串是否有效（内部已实现对NSNull的处理）
+ (BOOL)isStringValid:(NSString *)target;
+ (BOOL)isUserNameValid:(NSString *)inputUserName;
+ (BOOL)isRealNameValid:(NSString *)inputRealName;
+ (BOOL)isEmailValid:(NSString *)inputEmail;
+ (BOOL)isPhoneNumberValid:(NSString *)inputPhone;
+ (BOOL)isDigitCharacterString:(NSString *)string;
+ (BOOL)validateIdentityCard:(NSString *)identityCard;
+ (BOOL)validateIDCardNumber:(NSString *)identityCard;
//通过身份证获取性别和生日
+ (NSString *)sexStrFromIdentityCard:(NSString *)numberStr;
+ (NSString *)birthdayStrFromIdentityCard:(NSString *)numberStr;

+ (NSString *)convertTimeFormat:(NSString *)t1 toTimeFormat:(NSString *)t2 andTime:(NSString *)time;
+ (NSDate *)convertDateFromStr:(NSString *)dateStr andFormatter:(NSString *)formatter;
+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
+ (NSInteger) calcDaysFromBegin:(NSDate *)beginDate end:(NSDate *)endDate;//计算天数
//得到当前时间
+ (NSString *)getCurrentTime:(NSString *)format;
//date转str
+ (NSString *)convertTimeFromDate:(NSDate *)date andFormat:(NSString *)format;
+ (void)addBottomLine:(UIView *)view;
+ (void)addBottomLineByMasonry:(UIView *)view;
+ (void)addBottomLineByMasonry:(UIView *)view andColor:(NSString *)color;
+ (void)showText:(NSString *)text andView:(UIView *)view;
@end
