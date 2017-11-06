//
//  ViewController.m
//  自定义弹窗cell选中
//
//  Created by XYJ on 2017/5/12.
//  Copyright © 2017年 海角七梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHMultiSelectView : UIView

+(instancetype)createMultiSelectViewWithTitle:(NSString *)title andDataArray:(NSArray *)dataArray completeSelect:(void(^)(NSArray *selectArray))completeSelect;


@end
