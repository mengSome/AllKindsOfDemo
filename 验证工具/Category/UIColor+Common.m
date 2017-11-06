//
//  UIColor+Common.m
//  BZ_iOS
//
//  Created by HuangFei on 15/9/24.
//  Copyright © 2015年 BZ. All rights reserved.
//

#import "UIColor+Common.h"

@implementation UIColor (Common)

+ (UIColor*)colorWithHex:(long)hexColor
{
    return [UIColor colorWithHex:hexColor alpha:1.0];
}

+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity
{
    float red = ((float)((hexColor & 0xFF0000) >> 16)) / 255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8)) / 255.0;
    float blue = ((float)(hexColor & 0xFF)) / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

@end
