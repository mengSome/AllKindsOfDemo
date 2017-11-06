//
//  NSArray+Common.h
//  YJHealthDoctor
//
//  Created by iOS-MBP on 16/5/19.
//  Copyright © 2016年 XYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Common)

//将数组转为json字符串
- (NSString *)JSONString;

- (id)toArrayOrNSDictionary:(NSData *)jsonData;

@end
