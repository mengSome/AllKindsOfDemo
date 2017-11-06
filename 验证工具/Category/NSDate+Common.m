//
//  NSDate+Common.m
//  YJHealthDoctor
//
//  Created by iOS-MBP on 16/6/8.
//  Copyright © 2016年 XYJ. All rights reserved.
//

#import "NSDate+Common.h"

#import "JTDateHelper.h"

@implementation NSDate (Common)

+(NSTimeInterval)obtainTimeInterval{
    return [[NSDate date] timeIntervalSince1970]*1000;
}

+(NSDate *)caculateResultDateWithSelectDate:(NSDate *)choiceDate{
    //日期添加
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:1];
    [adcomps setMonth:0];
    [adcomps setDay:0];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:choiceDate options:0];
    return newdate;
}




+ (NSDate *)dateFromFormatterString:(NSString *)str
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter dateFromString:str];
}

+ (NSDate *)dateFromFormatterString:(NSString *)str withFormat:(NSString *)format
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:str];
}

+ (NSDate *)dateFromSecondsString:(NSString *)str
{
    NSInteger seconds = [str integerValue];
    return [NSDate dateWithTimeIntervalSince1970:seconds];
}

- (NSDate *)dateFromAlertType:(NSString *)alertType
{
    switch ([alertType integerValue]) {
        case 1:{//提前一小时
            return [NSDate dateWithTimeInterval:3600 sinceDate:self];
        }break;
        case 2:{//提前两小时
            return [NSDate dateWithTimeInterval:7200 sinceDate:self];
        }break;
        case 3:{//提前一天
            return [NSDate dateWithTimeInterval:86400 sinceDate:self];
        }break;
        default://当时
            return [NSDate dateWithTimeInterval:10 sinceDate:self];
//            return self;
            break;
    }
}

- (NSInteger)ageFromBirthday:(NSString *)birthday {
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate * birthdate = [formatter dateFromString:birthday];
    NSTimeInterval seconds = [self timeIntervalSinceDate:birthdate];
    return seconds / (3600*24*365);
}

- (NSInteger)daysFromDate:(NSDate *)fromDate {
    if ([[JTDateHelper new] date:self isTheSameDayThan:fromDate]) {
        return 0;
    } else {
        NSTimeInterval seconds = [self timeIntervalSinceDate:fromDate];
        return (seconds/3600/24 + 1);
    }
}
/**
 * 开始到结束的时间差
 */
+ (NSString *)dateTimeDifferenceWithStartTime:(NSString *)startTime endTime:(NSString *)endTime{
    NSDateFormatter *date = [[NSDateFormatter alloc]init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *startD =[date dateFromString:startTime];
    NSDate *endD = [date dateFromString:endTime];
    NSTimeInterval start = [startD timeIntervalSince1970]*1;
    NSTimeInterval end = [endD timeIntervalSince1970]*1;
    NSTimeInterval value = end - start;
    int second = (int)value %60;//秒
    int minute = (int)value /60%60;
    int house = (int)value / (24 * 3600)%3600;
    int day = (int)value / (24 * 3600);
    NSString *str;
    if (day != 0) {
        str = [NSString stringWithFormat:@"耗时%d天%d小时%d分%d秒",day,house,minute,second];
    }else if (day==0 && house != 0) {
        str = [NSString stringWithFormat:@"耗时%d小时%d分%d秒",house,minute,second];
    }else if (day== 0 && house== 0 && minute!=0) {
        str = [NSString stringWithFormat:@"耗时%d分%d秒",minute,second];
    }else{
        str = [NSString stringWithFormat:@"耗时%d秒",second];
    }
    return str;
}
@end
