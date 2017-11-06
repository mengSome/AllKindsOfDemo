//
//  NSDate+Common.h
//  YJHealthDoctor
//
//  Created by iOS-MBP on 16/6/8.
//  Copyright © 2016年 XYJ. All rights reserved.
//

//日期格式的转换
#import <Foundation/Foundation.h>

@interface NSDate (Common)

+ (NSDate *)dateFromFormatterString:(NSString *)str;
+ (NSDate *)dateFromFormatterString:(NSString *)str withFormat:(NSString *)format;

+ (NSDate *)dateFromSecondsString:(NSString *)str;
- (NSDate *)dateFromAlertType:(NSString *)alertType;

////判断两个日期的大小
//-(NSString *)compareDate1:(NSDate *)date1 andDate2:(NSDate *)date2;

- (NSInteger)ageFromBirthday:(NSString *)birthday;
- (NSInteger)daysFromDate:(NSDate *)fromDate;
//日期的计算
+ (NSString *)dateTimeDifferenceWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;
//日期加一年,返回加过后的
+(NSDate *)caculateResultDateWithSelectDate:(NSDate *)choiceDate;
//获得当前毫秒的时间拖
+(NSTimeInterval)obtainTimeInterval;
@end
