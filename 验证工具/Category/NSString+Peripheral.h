//
//  NSString+Peripheral.h
//  YJHealthDoctor
//
//  Created by xyj on 17/3/16.
//  Copyright © 2017年 XYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Peripheral)
//把字符串转为Data
+ (NSMutableData *)stringFromHex:(NSString *)str;
//把十六进制的字符串转换成10进制的数字
+ (NSInteger)dataWithStr:(NSString *)str;
//将NSData转为字符串
+ (NSString*)hexStringForData:(NSData*)data;
@end
