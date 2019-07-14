//
//  XTNavigationController.m
//  XT
//
//  Created by 邹圳巡 on 15/8/13.
//  Copyright (c) 2015年 CSHL. All rights reserved.
//

#import "XTNavigationController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "XTUtil.h"
@interface XTNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation XTNavigationController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationBar.translucent = NO;
//    //页面的统计
//    NSString *className = [NSString stringWithUTF8String:object_getClassName(self)];
//    [MobClick beginLogPageView:self.title];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    NSString *className = [NSString stringWithUTF8String:object_getClassName(self)];
//    [MobClick endLogPageView:self.title];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //设置navigationBar的颜色

    [self.navigationController.navigationBar setBackgroundImage:[XTUtil imageWithColor:[XTUtil colorWithHexString:@"#C0654B" alpha:1]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[XTUtil colorWithHexString:@"ffffff" alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:18]};

    [self removeDefaultShadow];
    
    //NavigationController堆栈内的UIViewController支持右滑手势的处理
//    self.interactivePopGestureRecognizer.delegate = nil;
    self.fd_fullscreenPopGestureRecognizer.enabled = YES;
}

- (void)removeDefaultShadow{
    if (self.navigationBar.subviews.count>0&&[self.navigationBar.subviews[0] subviews].count>0) {
        for (UIView *view in [self.navigationBar.subviews[0] subviews]) {
            if ([view isKindOfClass:[UIImageView class]]) {
                [view setHidden:YES];
            }
        }
    }
}

-(BOOL)shouldAutorotate {
    return [self.topViewController shouldAutorotate];
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden{
    return NO;
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (self.viewControllers.count<=1) {
        return NO;
    }
    return YES;
}

@end
