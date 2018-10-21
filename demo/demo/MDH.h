//
//  MDH.h
//  demo
//
//  Created by 张晓亮 on 2018/10/21.
//  Copyright © 2018 张晓亮. All rights reserved.
//

//下面的定义  是代码使用的 协议宏 。没办法 我是根据 项目来用的 ，现在单独弄出来，必不可少，你可以根据自己的需要删除或者更改


#import "UIView+Layout.h"
#import "UIColor+HEX.h"
#import "Masonry.h"
#import "WJGlobalDefines.h"
#import <sys/utsname.h>
//Masonry
#ifndef MDH_h
#define MDH_h

// 屏幕frame,bounds,size,scale
#define kScreenFrame            [UIScreen mainScreen].bounds
#define kScreenBounds           [UIScreen mainScreen].bounds
#define kScreenSize             [UIScreen mainScreen].bounds.size
#define kScreenScale            [UIScreen mainScreen].scale
#define kScreenW                [[UIScreen mainScreen] bounds].size.width
#define kScreenH                [[UIScreen mainScreen] bounds].size.height
#define kScaleW                 (kScreenW)*(kScreenScale)
#define kScaleH                 (kScreenH)*(kScreenScale)

#define SCREEN_WIDTH            [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT           [[UIScreen mainScreen] bounds].size.height

#define WEAKSELF __weak typeof(self) weakSelf = self;


// 以下为大众色值（可能整个app都有用到）
#define colorWithStr(colorStr)     [UIColor colorWithHexString:colorStr]

#define kEduBlackColor              colorWithStr(@"333333") //黑色字体

#define kAppPingFangSCMediumTextFont(FONTSIZE)         [UIFont fontWithName:@"PingFangSC-Regular" size:(FONTSIZE)]?[UIFont fontWithName:@"PingFangSC-Regular" size:(FONTSIZE)]:[UIFont systemFontOfSize:FONTSIZE]





#endif /* MDH_h */



