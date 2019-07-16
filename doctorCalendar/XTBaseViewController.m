//
//  XTBaseViewController.m
//
//  Created by leon on 15/8/12.
//  Copyright (c) 2015年 CSHL. All rights reserved.
//

#import "XTBaseViewController.h"
#import "XTUtil.h"

@interface XTBaseViewController()

@end

@implementation XTBaseViewController
- (void)loginComplete{

}

- (void)viewSafeAreaInsetsDidChange{
    [super viewSafeAreaInsetsDidChange];
//    NSLog(@"safeAreaInsets %@",NSStringFromUIEdgeInsets(self.view.safeAreaInsets));

}
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.navigationController.navigationBar setBackgroundImage:[XTUtil imageWithColor:[XTUtil colorWithHexString:@"#ffffff" alpha:1]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[XTUtil colorWithHexString:@"#232323" alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:18]};
    //iOS7不全屏布局（缺省值全屏）
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.fd_interactivePopDisabled = NO;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    NSString *className = [NSString stringWithUTF8String:object_getClassName(self)];
}

- (void)viewWillAppear:(BOOL)animated{
//    [self.navigationItem setHidesBackButton:YES];// 手势返回时会有蓝色 ... 在navigationbar 上
    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = NO;
    
    //页面的统计
    

    self.navigationItem.backBarButtonItem = nil;
    if (self.navigationController.viewControllers.count>1) {
        
        if (self.hideBackBtn == NO) {
            UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
            [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
            
            [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
            [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
            self.navigationItem.leftBarButtonItem = back;
            if (@available(iOS 11.0,*)) { /// 强迫症的朋友这里也是可以写成11.0
                [backBtn.widthAnchor constraintEqualToConstant:40].active = true;
                [backBtn.heightAnchor constraintEqualToConstant:40].active = true;
            }
        }
        else{
            [self.navigationItem setHidesBackButton:YES];
        }
//        self.navigationItem.leftBarButtonItem = //[XTUtil backBarButtonItemWithImage:[UIImage imageNamed:@"common_back"] target:self action:@selector(backAction) imageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    }else{
        
    }
}

//- (void)viewDidAppear:(BOOL)animated{
//    
//    [super viewDidAppear:animated];  
//    
////    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {  
////        
//////        [self prefersStatusBarHidden];  
//////        [self setNeedsStatusBarAppearanceUpdate];
////        
////    }  
//    
//}

- (void)backAction{
    if (self.backToRoot == YES) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}


- (BOOL)shouldAutorotate{
    
    return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}


- (UIImage *) getImageFromURL:(NSString *)fileURL

{
    UIImage * result;
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    
    result = [UIImage imageWithData:data];
    
    return result;
}

- (UIImage *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength {
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength) return image;
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    UIImage *resultImage = [UIImage imageWithData:data];
    if (data.length < maxLength) return resultImage;
    
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
    }
    
    return resultImage;
}

//- (BOOL)prefersStatusBarHidden{
//    return NO;
//}

@end
