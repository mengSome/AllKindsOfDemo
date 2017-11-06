//
//  JudgeTool.h
//  YJHealthDoctor
//
//  Created by xyj on 17/1/16.
//  Copyright © 2017年 XYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JudgeTool : NSObject

//邮箱
+ (BOOL) validateEmail:(NSString *)email;
//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile;
//车牌号验证
+ (BOOL) validateCarNo:(NSString *)carNo;
//车型
+ (BOOL) validateCarType:(NSString *)CarType;
//用户名
+ (BOOL) validateUserName:(NSString *)name;
//密码
+ (BOOL) validatePassword:(NSString *)passWord;

//密码 字母 数字 下划线 6-18 位  客户要求：密码：6-18位，数字，字母，下划线，至少要数字，字母两种以上不同组合，不能含有空格
+ (BOOL) validatePasswordA:(NSString *)passWord;
//昵称
+ (BOOL) validateNickname:(NSString *)nickname;
//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard;

@end
