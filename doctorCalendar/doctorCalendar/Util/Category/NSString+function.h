//
//  NSString+function.h
//  XT
// 
//  Created by 邹圳巡 on 15/8/11.
//  Copyright (c) 2015年 CSHL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (function)

// 自适应多平台 字体size
- (CGSize)sizeFitAllOSWithFont:(UIFont*)font constrainedToSize:(CGSize)size;

// 根据时间戳返回需求格式 字符串
- (NSString *)timeStringTranslation;

+ (NSString *) md5:(NSString *)str;

- (NSString *)urlEncode;
- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;

- (NSString *)urlDecode;
- (NSString *)urlDecodeUsingEncoding:(NSStringEncoding)encoding;

@end
