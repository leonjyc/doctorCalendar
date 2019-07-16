//
//  UIImage+function.h
//  XT
//
//  Created by 邹圳巡 on 15/8/11.
//  Copyright (c) 2015年 CSHL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (function)

/**
 @param size 等比缩放的目标size
 */
- (UIImage *)scaleToFitSize:(CGSize)size;

/**
 
 */

- (void)compressImage:(void(^)(UIImage * image))result;

+ (void)compressImages:(NSArray *)images finished:(void(^)(NSArray * images))result;

/**
 @param radius 模糊化精度 越大越模糊
 @return 模糊化的image
 */
- (UIImage *)blurImageWithRadius:(float)radius;

- (UIImage *)imageMaskWithColor:(UIColor *)maskColor;

- (UIImage *)imageFlippedHorizontal;

@end
