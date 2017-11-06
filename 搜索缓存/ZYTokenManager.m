//
//  ZYTokenManager.m
//  自定义搜索框并缓存搜索记录
//
//  Created by xiayong on 16/3/11.
//  Copyright © 2016年 bianguo. All rights reserved.
//

#import "ZYTokenManager.h"

@implementation ZYTokenManager


//缓存搜索数组
+(void)SearchText :(NSString *)seaTxt
{
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    //读取数组NSArray类型的数据
    NSArray *myArray = [userDefaultes arrayForKey:@"myArray"];
    if (myArray.count > 0) {//先取出数组，判断是否有值，有值继续添加，无值创建数组
        
    }else{
        myArray = [NSArray array];
    }
    for (NSString *string in myArray) {
        if ([string isEqualToString:seaTxt]) {
            return;
        }
    }
    // NSArray --> NSMutableArray
    NSMutableArray *searTXT = [myArray mutableCopy];
    [searTXT insertObject:seaTxt atIndex:0];
//    [searTXT addObject:seaTxt];
    if(searTXT.count > 3)
    {
        [searTXT removeObjectAtIndex:3];
    }
//    NSSet *set = [NSSet setWithArray:searTXT];
    
 
    //将上述数据全部存储到NSUserDefaults中
    //        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaultes setObject:searTXT forKey:@"myArray"];
    [userDefaultes synchronize];
}
+(void)removeAllArray{
    NSUserDefaults* userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault removeObjectForKey:@"myArray"];
    [userDefault synchronize];
}


@end
