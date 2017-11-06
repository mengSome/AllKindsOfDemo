//
//  UIImage+Common.h
//  YJHealthDoctor
//
//  Created by iOS-MBP on 16/4/26.
//  Copyright © 2016年 XYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Common)

/*
 *根据颜色生成一张图片
 * @param color 图片颜色
 * @param size 图片尺寸
 */
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;

/**
 *  根据CIImage生成指定大小的UIImage
 *
 *  @param image CIImage
 *  @param size  图片宽度
 */
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size;

@end
