//
//  NSArray+Common.m
//  YJHealthDoctor
//
//  Created by iOS-MBP on 16/5/19.
//  Copyright © 2016年 XYJ. All rights reserved.
//

#import "NSArray+Common.h"

@implementation NSArray (Common)

- (NSString *)JSONString
{
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    NSString * jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonStr;
}

- (id)toArrayOrNSDictionary:(NSData *)jsonData{
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    
    if (jsonObject != nil && error == nil){
        return jsonObject;
    }else{
        // 解析错误
        return nil;
    }
    
}





@end
