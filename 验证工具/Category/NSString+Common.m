//
//  NSString+Common.m
//  YJHealthDoctor
//
//  Created by iOS-MBP on 16/5/11.
//  Copyright © 2016年 XYJ. All rights reserved.
//

#import "NSString+Common.h"
#import "MBProgressHUD+TemporaryShow.h"
#define myDotNumbers     @"0123456789.\n"
#define myNumbers          @"0123456789\n"
@implementation NSString (Common)
//控制小数点输入
+(BOOL)stringWith:(NSString *)string andInteger:(NSInteger)inter andChar:(NSInteger)cha andRange:(NSRange)range andInt:(NSInteger)allInt andWith:(NSString *)textField{
    if (![string isEqualToString:@""])
    {
        NSCharacterSet *cs;
        // 小数点在字符串中的位置 第一个数字从0位置开始
        NSInteger dotLocation = [textField rangeOfString:@"."].location;
        // 判断字符串中是否有小数点，并且小数点不在第一位
        // NSNotFound 表示请求操作的某个内容或者item没有发现，或者不存在
        // range.location 表示的是当前输入的内容在整个字符串中的位置，位置编号从0开始
        if (dotLocation == NSNotFound && range.location != 0)
        {
            // 取只包含“myDotNumbers”中包含的内容，其余内容都被去掉
            /* [NSCharacterSet characterSetWithCharactersInString:myDotNumbers]的作用是去掉"myDotNumbers"中包含的所有内容，只要字符串中有内容与"myDotNumbers"中的部分内容相同都会被舍去在上述方法的末尾加上invertedSet就会使作用颠倒，只取与“myDotNumbers”中内容相同的字符 */
            cs = [[NSCharacterSet characterSetWithCharactersInString:myDotNumbers] invertedSet];
            if (range.location >= inter)
            {
                NSLog(@"整数位不能过3位");
             
                if ([string isEqualToString:@"."] && range.location == inter)
                {
                    return YES;
                }else{
                   [MBProgressHUD temporaryShowWithContent:[NSString stringWithFormat:@"不能超过%zd位整数",inter]];
                return NO;
                }
            }
        }
        else
        {
            cs = [[NSCharacterSet characterSetWithCharactersInString:myNumbers] invertedSet]; }
        // 按cs分离出数组,数组按@""分离出字符串
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        BOOL basicTest = [string isEqualToString:filtered];
        if (!basicTest)
        {
            NSLog(@"只能输入数字和小数点");
            return NO;
        }
        if (dotLocation != NSNotFound && range.location > dotLocation + cha)
        {
             [MBProgressHUD temporaryShowWithContent:[NSString stringWithFormat:@"小数点后最多%zd位整数",cha]];
            NSLog(@"小数点后最多两位");
            return NO;
            
        }
        if (textField.length > allInt)
        {
              [MBProgressHUD temporaryShowWithContent:[NSString stringWithFormat:@"不能超过%zd位字符",allInt]];
            NSLog(@"整个不能超过%zd字符",allInt);
            return NO;
        }
    }
    return YES;
    
    
    
}


+ (NSString *)stringFromGender:(NSString *)gender
{
    if (IsEmpty(gender)) {
        return @"";
    }
    switch ([gender integerValue]) {
        case 0:
            return @"男";
            break;
        case 1:
            return @"女";
            break;
        default:
            return @"";
            break;
    }
}

+ (NSString *)stringFromWeekDay:(NSString *)weekDay {
    if (IsEmpty(weekDay)) {
        return @"";
    }
    switch ([weekDay integerValue]) {
        case 1: return @"周一"; break;
        case 2: return @"周二"; break;
        case 3: return @"周三"; break;
        case 4: return @"周四"; break;
        case 5: return @"周五"; break;
        case 6: return @"周六"; break;
        case 7: return @"周日"; break;
        default: return @""; break;
    }
}

+ (NSString *)stringFromAlertType:(NSString *)alertType
{
    switch ([alertType integerValue]) {
        case 0:
            return @"当时";
            break;
        case 1:
            return @"提前一小时";
            break;
        case 2:
            return @"提前两小时";
            break;
        case 3:
            return @"提前一天";
            break;
        default:
            return @"";
            break;
    }
}

+ (NSString *)secondsStringFromDate:(NSDate *)date
{
    NSInteger seconds = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%ld", seconds];
}

+ (NSString *)formattedStringFromDate:(NSDate *)date
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd a hh:mm"];
    NSString * dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}

+ (NSString *)formattedDateStrFromDate:(NSDate *)date
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString * dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}

+ (NSString *)formattedTimeStrFromDate:(NSDate *)date
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"a hh:mm"];
    NSString * dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}

+(NSString *)compareDate1:(NSDate *)date1 andDate2:(NSDate *)date2{
    NSComparisonResult result = [date1 compare:date2];
    NSString *str  = @"";
    if (result == NSOrderedAscending) {
        str = @"-1";
    }
    if (result == NSOrderedSame){
        str = @"0";
    }
    if (result == NSOrderedDescending) {
        str = @"1";
    }
    return str;
}

+ (NSString *)formattedStringFromDate:(NSDate *)date formatter:(NSString *)formatter {
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSString * dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}

+(NSString *)ageFormBirDate:(NSDate *)bornDate{
    //获得当前系统时间
    NSDate *currentDate = [NSDate date];
    //获得当前系统时间与出生日期之间的时间间隔
    NSTimeInterval time = [currentDate timeIntervalSinceDate:bornDate];
    //时间间隔以秒作为单位,求年的话除以60*60*24*356
    int age = ((int)time)/(3600*24*365);
    return [NSString stringWithFormat:@"%d",age];
}

- (CGFloat)calculateHeightWithAttributes:(NSDictionary *)attributes width:(CGFloat)width
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width * 0.7, 0) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil];
    return rect.size.height;
}

- (BOOL)validateNumberByRegExp:(NSString *)regExp {
    NSString * number= regExp;
    NSPredicate * numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
    return [numberPre evaluateWithObject:self];
}
//获取重点人群标签
+(NSString *)setSmoeWith:(NSArray *)array{
    NSString *string;
    NSMutableArray *followData = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        if ([array[i] isEqualToString:@"1"]) {
            [followData addObject:@"1"];
        }
        if ([array[i] isEqualToString:@"2"]) {
            [followData addObject:@"2"];
        }
        if ([array[i] isEqualToString:@"3"]) {
            [followData addObject:@"3"];
        }
        if ([array[i] isEqualToString:@"4"]) {
            [followData addObject:@"4"];
        }
        if ([array[i] isEqualToString:@"5"]) {
            [followData addObject:@"5"];
        }
        if ([array[i] isEqualToString:@"6"]) {
            [followData addObject:@"6"];
        }
    }
    if (!IsEmpty(followData)) {
        string   = [followData componentsJoinedByString:@","];
        
    }else{
        string = @"";
    }
    return string;
}

@end
