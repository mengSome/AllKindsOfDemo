//
//  UIButton+common.m
//  YJHealthDoctor
//
//  Created by xyj on 17/3/15.
//  Copyright © 2017年 XYJ. All rights reserved.
//

#import "UIButton+common.h"

@implementation UIButton (common)
+(UIButton *)creatNavigationBarBackBtn{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    backBtn.frame = CGRectMake(0, 0, 60, 40);
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return backBtn;
}
@end
