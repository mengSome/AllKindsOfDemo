//
//  NSString+Peripheral.m
//  YJHealthDoctor
//
//  Created by xyj on 17/3/16.
//  Copyright © 2017年 XYJ. All rights reserved.
//

#import "NSString+Peripheral.h"

@implementation NSString (Peripheral)

+ (NSMutableData *)stringFromHex:(NSString *)str{//将字符串转为NSData
    NSMutableData *stringData = [[NSMutableData alloc] init];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < [str length] / 2; i++) {
        byte_chars[0] = [str characterAtIndex:i*2];
        byte_chars[1] = [str characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [stringData appendBytes:&whole_byte length:1];
    }
    //翻译后的字符举例:data:<cccc0203 04030006>
    return stringData;
}

+ (NSInteger)dataWithStr:(NSString *)str{
    int sum = 0;
    
    for (NSInteger j = 0; j < str.length; j++) {
        char c = [str characterAtIndex:j];
        char cs = toupper(c);
        int a = 0;
        if (cs >= 'A' && cs <='F') {
            a = cs - 'A' + 10;
        } else
        {
            a = cs - '0';
        }
        sum += a * pow(16, str.length - 1 - j);
    }
    return sum;
}
+ (NSString*)hexStringForData:(NSData*)data{
    if (data == nil) {
        return nil;
    }
    NSMutableString* hexString = [NSMutableString string];
    const unsigned char *p = [data bytes];
    for (int i=0; i < [data length]; i++) {
        [hexString appendFormat:@"%02x", *p++];
    }
    return hexString;
    
}
@end
