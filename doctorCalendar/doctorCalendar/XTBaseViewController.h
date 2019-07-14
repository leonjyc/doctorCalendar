//
//  XTBaseViewController.h
//  XT
//
//  Created by 邹圳巡 on 15/8/12.
//  Copyright (c) 2015年 CSHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationController+FDFullscreenPopGesture.h"
@class YoohfitShareModel;
@interface XTBaseViewController : UIViewController
@property (nonatomic,assign) BOOL hideBackBtn;
//- (void)createRightShopCar;
//- (void)countTotalShopcarCount;
- (void)backAction;

@property BOOL backToRoot;


@end
