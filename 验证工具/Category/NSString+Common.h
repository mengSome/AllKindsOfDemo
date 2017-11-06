//
//  NSString+Common.h
//  YJHealthDoctor
//
//  Created by iOS-MBP on 16/5/11.
//  Copyright © 2016年 XYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Common)


/**
 通过输入0,1字符串,输出男,女字符串

 @param gender 取值为:"0","1"

 @return 男(0),女(1),""()
 */
+ (NSString *)stringFromGender:(NSString *)gender;

/**
 @param weekDay 输入参数为:0,1,2...

 @return 输出结果: 星期一,星期二...
 */
+ (NSString *)stringFromWeekDay:(NSString *)weekDay;

/**
 返回时间段

 @param alertType 根据输入0,1,2...

 @return 返回:当时,提前一小时....
 */
+ (NSString *)stringFromAlertType:(NSString *)alertType;

/**
 将NSDate转为秒时间戳
 */
+ (NSString *)secondsStringFromDate:(NSDate *)date;

/**
 时间格式的转换常用
 */
+ (NSString *)formattedStringFromDate:(NSDate *)date;
+ (NSString *)formattedDateStrFromDate:(NSDate *)date;
+ (NSString *)formattedTimeStrFromDate:(NSDate *)date;
+ (NSString *)formattedStringFromDate:(NSDate *)date formatter:(NSString *)formatter;
//判断两个日期的大小
+(NSString *)compareDate1:(NSDate *)date1 andDate2:(NSDate *)date2;
//根据生日计算年龄
+(NSString *)ageFormBirDate:(NSDate *)birDate;

//根据文字属性,计算出文字的高度
- (CGFloat)calculateHeightWithAttributes:(NSDictionary *)attributes width:(CGFloat)width;
+(NSString *)setSmoeWith:(NSArray *)array;
//正则
- (BOOL)validateNumberByRegExp:(NSString *)regExp;
+(BOOL)stringWith:(NSString *)string andInteger:(NSInteger)inter andChar:(NSInteger)cha andRange:(NSRange)range andInt:(NSInteger)allInt andWith:(NSString *)textField;
@end
