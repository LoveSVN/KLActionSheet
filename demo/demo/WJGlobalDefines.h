//
//  WJGlobalDefines.h
//  WJPorjectFactorySource
//
//  Created by jidx on 2017/2/4.
//  Copyright © 2017年 Company. All rights reserved.
//

#import <UIKit/UIKit.h>


#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define WJKIT_IS_IOS8_OR_LATER      SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")
#define WJKIT_IS_IOS9_OR_LATER      SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9.0")
#define WJKIT_IS_IOS10_OR_LATER     SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")
#define WJKIT_IS_IOS11_OR_LATER     SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"11.0")

#define SCREEN_MODE_SIZE                [UIScreen mainScreen].currentMode.size
#define SCREEN_NATIVEBOUNDS_SIZE        [UIScreen mainScreen].nativeBounds.size
#define WJKIT_NATIVE_IS_IPHONE_PLUS     (CGSizeEqualToSize(CGSizeMake(1242, 2208), SCREEN_NATIVEBOUNDS_SIZE) || CGSizeEqualToSize(CGSizeMake(2208, 1242), SCREEN_NATIVEBOUNDS_SIZE))
#define WJKIT_CURRENT_IS_IPHONE_PLUS    (CGSizeEqualToSize(CGSizeMake(1242, 2208), SCREEN_MODE_SIZE) || CGSizeEqualToSize(CGSizeMake(2208, 1242), SCREEN_MODE_SIZE))
#define IPHONE_MODE ({\
struct utsname systemInfo;\
uname(&systemInfo);\
NSString *device_model = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];\
    (device_model);\
})
#define WJKIT_NATIVE_IS_IPHONE_X  ({\
NSString *device_model = IPHONE_MODE;\
BOOL iphonex = NO;\
if ([device_model isEqualToString:@"x86_64"]) {\
device_model = [NSProcessInfo processInfo].environment[@"SIMULATOR_MODEL_IDENTIFIER"];\
}\
if ([device_model isEqualToString:@"iPhone10,3"]) {\
iphonex = YES;\
}\
if ([device_model isEqualToString:@"iPhone10,6"]) {\
iphonex = YES;\
}\
if ([device_model isEqualToString:@"iPhone11,8"]) {\
iphonex = YES;\
}\
if ([device_model isEqualToString:@"iPhone11,2"]) {\
iphonex = YES;\
}\
if ([device_model isEqualToString:@"iPhone11,6"]) {\
iphonex = YES;\
}\
(iphonex);\
})
#define WJKIT_LINE_THICKNESS            (1.0 / [UIScreen mainScreen].scale)
#define WJKIT_LINE_ADJUST_OFFSET        ((((int)(WJKIT_LINE_THICKNESS * [UIScreen mainScreen].scale) + 1) % 2 == 0) ? (WJKIT_LINE_THICKNESS / 2) : 0)
#define WJKIT_SCREEN_SCALE_IS_3         ([UIScreen mainScreen].scale >= 2.99999 && [UIScreen mainScreen].scale <= 3.00001)

#define WJKIT_SHORT_VERSION_STRING      ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
#define WJKIT_BUNDLER_VERSION_STRING    ([[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleVersionKey])
#define WJKIT_DISPLAY_NAME_STRING      ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"])

#ifdef DEBUG
#   define TODO() [[[[UIApplication sharedApplication] delegate] window] wj_showStaticHUD:@"这个功能还没做呢" duration:0.3]
#else
#   define TODO()
#endif

#define WJKIT_STATUSBAR_HEIGHT              (WJKIT_NATIVE_IS_IPHONE_X ? 44.0f : 20.0f)
#define WJKIT_NAVIGATIONBAR_HEIGHT          (44.0f + WJKIT_STATUSBAR_HEIGHT)

#define WJKIT_NAVIGATIONBAR_BUTTON_SIZE     CGSizeMake(40, 40)
#define WJKIT_TABBAR_BOTTOM_INSET           (WJKIT_NATIVE_IS_IPHONE_X ? 34.0f : 0.0f)
#define WJKIT_TABBAR_HEIGHT                 (49.0f + WJKIT_TABBAR_BOTTOM_INSET)
#define WJKIT_TABBAR_TITLE_FONT_SIZE        10.0f

#define WJKIT_GENERAL_H_MARGIN              15.0f
#define WJKIT_GENERAL_SPACING1              5.0f
#define WJKIT_GENERAL_SPACING2              10.0f
#define WJKIT_GENERAL_SPACING3              15.0f
#define WJKIT_GENERAL_SPACING4              20.0f


#define WJKIT_GENERAL_CN_FONT_Medium_NAME   @"PingFangSC-Medium"
#define WJKIT_GENERAL_CN_FONT_NAME          @"Heiti SC"
#define WJKIT_GENERAL_CN_FONT_NAME_BOLD     @"Heiti SC-Bold"
#define WJKIT_GENERAL_EN_FONT_NAME          @"HelveticaNeue"
#define WJKIT_GENERAL_EN_FONT_NAME_BOLD     @"HelveticaNeue-Bold"

#define WJKIT_GENERAL_BASE_FONTSIZE         (WJKIT_CURRENT_IS_IPHONE_PLUS ? 19.0f : 18.0f)
#define WJKIT_GENERAL_FONTSIZE_S1           (WJKIT_GENERAL_BASE_FONTSIZE - 3)  // 15
#define WJKIT_GENERAL_FONTSIZE_S2           (WJKIT_GENERAL_BASE_FONTSIZE - 4)  // 14
#define WJKIT_GENERAL_FONTSIZE_S3           (WJKIT_GENERAL_BASE_FONTSIZE - 6)  // 12
#define WJKIT_GENERAL_FONTSIZE_S4           (WJKIT_GENERAL_BASE_FONTSIZE - 8)  // 10

#define WJKIT_FILTERBAR_HEIGHT              roundf(WJKIT_GENERAL_BASE_FONTSIZE * 2.2)
#define WJKIT_TEXT_FIELD_HEIGHT             roundf(WJKIT_GENERAL_BASE_FONTSIZE * 2.2)
#define WJKIT_LONG_BUTTON_HEIGHT            roundf(WJKIT_GENERAL_BASE_FONTSIZE * 2.3)
#define WJKIT_TITLE_CELL_HEIGHT             roundf(WJKIT_GENERAL_BASE_FONTSIZE * 2.6)
#define WJKIT_SEGMENT_CONTROL_HEIGHT        roundf(WJKIT_GENERAL_BASE_FONTSIZE * 2.5)
#define WJKIT_COMMON_CELL_HEIGHT            roundf(WJKIT_GENERAL_BASE_FONTSIZE * 3.3)

#define WJKIT_RESULT_DESCRIPTION_VALUE(dictInfo)    [(dictInfo) objectForKey:@"description"]
#define WJKIT_ERROR_USER_INFO(dictInfo) @{NSLocalizedDescriptionKey:(WJKIT_RESULT_DESCRIPTION_VALUE(dictInfo)?:@"加载失败")}
#define WJNETWORK_SERVER_CODE_FAILDDOMAIN   @"WJ_SERVER_CODE_ERROR"
#define WJNETWORK_CACHED_TIME_KEY           @"WJ-Cache-Expiration-Time"
#define WJNETWORK_CACHED_DATE_KEY           @"WJ-Cache-Expiration-Date"
#define WJKIT_CACHED_TIMES_ONE_WEAK         604800
#define WJKIT_CACHED_TIMES_ONE_DAY          86400
#define WJKIT_CACHED_TIMES_ONE_HOUR         3600

typedef void(^WJVoidBlock)(void);

typedef NS_ENUM(NSInteger, WJServerErrorCode) {
    WJServerErrorAccountNeedRelogin = 1002,
    WJServerErrorAddFavoriteDuplicate = 1003,
    WJServerErrorRemoveFavoriteNotFound = 1004,
    WJServerErrorChangePwdOldPwdNotFound = 1005,
};

