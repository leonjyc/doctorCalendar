//
//  UIMacros.h
//  XTScence
//
//  Created by leon on 16/5/23.
//  Copyright © 2016年 Clear. All rights reserved.
//

#ifndef UIMacros_h
#define UIMacros_h
#define KTesting NO
#define KAmapKey @"20be4f563945cf7b99fedf89b1245e7d"
#define KSSLCertificate @"none"
#define KNeedSSLCertificate NO
#define kCacheTime 60*60*24*2
#define kNeedCache YES
#define kNotNeedCachePath @[@"tickets"]
#define kPostNeedCachePath @[@"orderInfo",@"orderInfoList",@"getAlipayStr"]
#define IOS11   @available(iOS 11.0, *)
#define KAppScheme   @"YoohFitPay"
#define kAliPayCallBack @"AliPayCallBack"

#define RandomColor [UIColor colorWithHue:(arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5 brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:1];
// UIScreen width.

#define  LL_ScreenWidth   [UIScreen mainScreen].bounds.size.width



// UIScreen height.

#define  LL_ScreenHeight  [UIScreen mainScreen].bounds.size.height

// iPhone X

#define LL_iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define IS_IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

//#define  LL_iPhoneX (@available(iOS 11.0, *) ？ [[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom > 0.0 : NO )
//判断iPhoneX，Xs（iPhoneX，iPhoneXs）
//#define IS_IPHONE_X (@available(iOS 11.0, *) ？ [[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom > 0.0 : NO )

//判断iPhoneX所有系列
#define IS_PhoneXAll (IS_IPHONE_X || IS_IPHONE_Xr || IS_IPHONE_Xs_Max)
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define IPHONEXx (@available(iOS 11.0, *) ？ [[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom > 0.0 : NO )



// Status bar height.

#define  LL_StatusBarHeight      (LL_iPhoneX ? 44.f : 20.f)



// Navigation bar height.

#define  LL_NavigationBarHeight  44.f



// Tabbar height.

#define  LL_TabbarHeight         (LL_iPhoneX ? (49.f+34.f) : 49.f)



// Tabbar safe bottom margin.

#define  LL_TabbarSafeBottomMargin         (LL_iPhoneX ? 34.f : 0.f)



// Status bar & navigation bar height.

#define  LL_StatusBarAndNavigationBarHeight  (LL_iPhoneX ? 88.f : 64.f)

#define LL_ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})

#define IS_IPHONE_5 ([XTUtil screenHeight] == 568.0)
#define IS_IPHONE_6 ([XTUtil screenHeight] == 667.0)
#define IS_IPHONE_6P ([XTUtil screenHeight] == 736.0)
//#define IS_IPHONE_X ([XTUtil screenHeight] == 812.0f) ? YES : NO
#define mainColor [XTUtil colorWithHexString:@"#12A5AF" alpha:1]

#define kXTTicketViewCellHeight 60
#define kXTPassengerListCellHeight 100
#define kXTLeftOffeset 10

#define kXTSmallMargin 10
#define kXTMiddleMargin 20
#define kXTLargeMargin 30

#define kLargeFont [UIFont systemFontOfSize:15]
#define kMiddleFont [UIFont systemFontOfSize:12]
#define kSmallFont [UIFont systemFontOfSize:10]

#define kLargeTableListTitleFont [UIFont systemFontOfSize:18]
#define kMiddleTableListSubTitleFont [UIFont systemFontOfSize:13]

#define kButtonOrangeColor @"F77435"
#define kSubTitleTextColor [UIColor grayColor]
#define kPriceTitleTextColor @"A77071"

#define KZFBNotification @"KZFBNotification"
#define KWXPayNotification @"KWXPayNotification"
#define KDanmuNotification @"KDanmuNotification"
#define KPoptoTicketFromRegisterNotification @"KPoptoTicketFromRegisterNotification"
#define KBuyTicket @"KBuyTicket"


#define KLoadingImage @"loading"
#define KLoadingFailImage @"loadfail.png"


#define KQQappid @"1105539012"
#define KWeiboID @"3803401884"//西塘的key 还没替换
#define KWechatid @"wx2173f7c9a1878b29"


#define kRedirectURI    @"http://www.sina.com"
//#define kFoodImageViewPlaceHolderImageName @"titleView"


#define kStrategyImagesize 5/9
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define KImageWidth  kScreenWidth/12*5
#define kStrategyDays @{@"1":@"第一天",@"2":@"第二天",@"3":@"第三天",@"4":@"第四天",@"5":@"第五天",@"6":@"第六天",@"7":@"第七天",@"8":@"第八天",@"9":@"第九天",@"10":@"第十天",@"11":@"第十一天",@"12":@"第十二天",@"13":@"第十三天",@"14":@"第十四天",@"15":@"第十五天",@"16":@"第十六天",@"17":@"第十七天",@"18":@"第十八天",@"19":@"第十九天",@"20":@"第二十天"}
#define KXingcheng @[@"行程一",@"行程二",@"行程三",@"行程四",@"行程五",@"行程六",@"行程七",@"行程八",@"行程九",@"行程十",@"行程十一",@"行程十二",@"行程十三",@"行程十四",@"行程十五",@"行程十六",@"行程十七",@"行程十八",@"行程十九",@"行程二十"]
//

#define KNetworkError @"连接服务器失败"
#define KNullDescription @"没有列表信息"
#define KHXLogout @"huanxinlogout"
#define KNearbyScenceChange @"KNearbyScenceChange"
#define SelectBtnColor @"#59210A"
#define UnSelectBtnColor @"#D4D7D6"
#define BCryptSalt @"$2a$10$17LNAR2JXgYrJNZjv2KFcu"
//是否使用验证码
#define UseCode YES
#define WeakSelf(weakSelf)  __weak __typeof(self) weakSelf = self;

#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#endif /* UIMacros_h */
