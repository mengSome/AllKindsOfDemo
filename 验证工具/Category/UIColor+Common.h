//
//  UIColor+Common.h
//  BZ_iOS
//
//  Created by HuangFei on 15/9/24.
//  Copyright © 2015年 BZ. All rights reserved.
//

//十六进制颜色取值[UIColor colorWithHex:0x888888]

#import <UIKit/UIKit.h>

@interface UIColor (Common)

+ (UIColor*)colorWithHex:(long)hexColor;

+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

@end
