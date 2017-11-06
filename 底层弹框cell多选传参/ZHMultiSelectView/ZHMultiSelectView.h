//
//  ZHMultiSelectView.h
//  MultiSelectDemo
//
//  Created by xyj on 17/5/10.
//  Copyright © 2017年 xyj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHMultiSelectView : UIView

//用于如果有两个元素互斥只能选一个时用
-(void)setItemConfictWithIndex1:(NSInteger) index1 andIndex2:(NSInteger)index2;
//若果想提前显示一些元素
-(void)setDidSelectedDataArray:(NSArray *)didSelectedArray;
/**
 多选弹框

 @param title 弹框的标题
 @param dataArray 传入的数据
 @param completeSelect
 
 */
+(instancetype)createMultiSelectViewWithTitle:(NSString *)title andDataArray:(NSArray *)dataArray completeSelect:(void(^)(NSArray *selectArray))completeSelect;


@end
