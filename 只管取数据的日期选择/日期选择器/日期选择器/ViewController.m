//
//  ViewController.m
//  日期选择器
//
//  Created by XYJ on 2017/5/12.
//  Copyright © 2017年 海角七梦. All rights reserved.
//

#import "ViewController.h"
#import "ZHDatePickerView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;

@end

@implementation ViewController
- (IBAction)dataAction:(id)sender {
    [ZHDatePickerView datePickerViewWithType:DatePicerTypeDefault andChoiceBlock:^(NSDate *choiceDate) {
        _dataLabel.text = [NSString stringWithFormat:@"%@",[self dateToString:choiceDate withDateFormat:@"yyyy-MM-dd HH:mm:ss"]];
        NSLog(@"%@",choiceDate);
    }];
}
//日期格式转字符串
- (NSString *)dateToString:(NSDate *)date withDateFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}
//字符串转日期格式
- (NSDate *)stringToDate:(NSString *)dateString withDateFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
