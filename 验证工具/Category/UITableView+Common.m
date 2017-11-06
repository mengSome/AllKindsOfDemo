//
//  UITableView+Common.m
//  YJHealthDoctor
//
//  Created by iOS-MBP on 16/6/2.
//  Copyright © 2016年 XYJ. All rights reserved.
//

#import "UITableView+Common.h"

@implementation UITableView (Common)

//隐藏多余cell分割线
- (void)setExtraCellLineHidden
{
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:view];
}

@end
