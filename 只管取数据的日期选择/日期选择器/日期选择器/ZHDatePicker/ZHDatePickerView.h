//
//  ViewController.m
//  日期选择器
//
//  Created by XYJ on 2017/5/12.
//  Copyright © 2017年 海角七梦. All rights reserved.
//

typedef enum {
    //日期格式选择 根据需要选择
    DatePicerTypeDefault = 0,
    DatePicerTypeTime = 1,
    DatePicerTypeDateAndTime = 2,
    DatePicerTypeCountDownTimer = 3
}DatePicerType;

#import <UIKit/UIKit.h>

@interface ZHDatePickerView : UIView
//注意:不用考block虑循环引用,内部已经处理
+(void)datePickerViewWithType:(DatePicerType) datePickerType andChoiceBlock: (void (^)(NSDate *choiceDate))choiceBlock;
@end
