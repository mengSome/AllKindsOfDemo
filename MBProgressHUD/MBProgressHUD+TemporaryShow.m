//
//  MBProgressHUD+TemporaryShow.m
//  YJHealthDoctor
//
//  Created by xyj on 17/5/5.
//  Copyright © 2017年 XYJ. All rights reserved.
//

#import "MBProgressHUD+TemporaryShow.h"

@implementation MBProgressHUD (TemporaryShow)
+(void)temporaryShowWithContent:(NSString *)content{
    MBProgressHUD *textHud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    textHud.mode = MBProgressHUDModeText;
    textHud.label.text = NSLocalizedString(content, @"HUD message title");
    textHud.offset = CGPointMake(0.f, 0.f);
    [textHud hideAnimated:YES afterDelay:1.f];
}

@end
