//
//  ZHMultiSelectView.m
//  MultiSelectDemo
//
//  Created by xyj on 17/5/10.
//  Copyright © 2017年 xyj. All rights reserved.
//

#define ZHSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define ZHSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define ZHToolViewHeight     40
#define ZHToolBtnWidth       70
#define ZHMultiSelectViewHeight   200

#import "ZHMultiSelectView.h"
#import "ZHMultiSelectCell.h"

static UITableView *tableView_;
static void(^completeBlock_)(NSArray *);
static NSArray *dataArray_;
static NSString *title_;
static NSInteger index1_;
static NSInteger index2_;
static NSArray *didDataArray_;
@interface ZHMultiSelectView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *selectArray;
@end

@implementation ZHMultiSelectView
-(NSMutableArray *)selectArray{
    if (_selectArray == nil) {
        _selectArray = [NSMutableArray array];
    }
    return _selectArray ;
}

+(instancetype)createMultiSelectViewWithTitle:(NSString *)title andDataArray:(NSArray *)dataArray completeSelect:(void (^)(NSArray *))completeSelect{
    dataArray_ = dataArray;
    completeBlock_ = completeSelect;
    title_ = title;
    ZHMultiSelectView *multiSelectView = [[self alloc] init];
    return multiSelectView;
}


-(instancetype)init{
    if (self = [super init]) {
        
        [self setup];
    }
    return self;
}
-(void)setup{
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
    self.frame =  [UIScreen mainScreen].bounds;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [self.selectArray  removeAllObjects];
    for (int i = 0; i< dataArray_.count; i++) {
        [self.selectArray addObject:@NO];
    }
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0,ZHSCREEN_HEIGHT, ZHSCREEN_WIDTH, ZHMultiSelectViewHeight);
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerNib:[UINib nibWithNibName:@"ZHMultiSelectCell" bundle:nil] forCellReuseIdentifier:@"ZHMultiSelectCell"];
    tableView.tableFooterView = [[UIView alloc] init];
    [self addSubview:tableView];
    tableView_ = tableView;
    
    UIView * toolView = [[UIView alloc] initWithFrame:CGRectMake(0, ZHSCREEN_HEIGHT, ZHSCREEN_WIDTH, ZHToolViewHeight)];
    toolView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    [self addSubview:toolView];
    UIButton * cancleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    cancleBtn.frame = CGRectMake(0, 0, ZHToolBtnWidth, ZHToolViewHeight);
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancleBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [cancleBtn addTarget:self action:@selector(cancleBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:cancleBtn];
    //标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.frame = CGRectMake((ZHSCREEN_WIDTH - (SCREEN_WIDTH - 2*ZHToolBtnWidth -10))*0.5, 0, SCREEN_WIDTH - 2*ZHToolBtnWidth -10 , ZHToolViewHeight);
    [toolView addSubview:titleLabel];
    titleLabel.text = title_;
    
    //确定按钮
    UIButton * confirmBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    confirmBtn.frame = CGRectMake(ZHSCREEN_WIDTH - ZHToolBtnWidth, 0, ZHToolBtnWidth, ZHToolViewHeight);
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [confirmBtn addTarget:self action:@selector(confirmBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:confirmBtn];
    
    //动画的实现
    [UIView animateWithDuration:0.25 animations:^{
        tableView_.frame = CGRectMake(0, ZHSCREEN_HEIGHT - ZHMultiSelectViewHeight, ZHSCREEN_WIDTH, ZHMultiSelectViewHeight);
        toolView.frame = CGRectMake(0, ZHSCREEN_HEIGHT - ZHMultiSelectViewHeight - ZHToolViewHeight, ZHSCREEN_WIDTH, ZHToolViewHeight);
    }];
    
}

-(void)setItemConfictWithIndex1:(NSInteger)index1 andIndex2:(NSInteger)index2{
    index1_ = index1;
    index2_ = index2;
}

-(void)setDidSelectedDataArray:(NSArray *)didSelectedArray{
    didDataArray_ = didSelectedArray;
    for (NSString *str  in didSelectedArray) {
        NSInteger indexx = [didSelectedArray indexOfObject:str];
        self.selectArray[indexx]  = @(YES);
    }
    [tableView_ reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArray_.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZHMultiSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZHMultiSelectCell"];
    cell.contentLabel.text = dataArray_[indexPath.row];

    cell.selectImageView.hidden = ![self.selectArray[indexPath.row] boolValue];
       return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //1.设置当前的为选中
    self.selectArray[indexPath.row] = @(![self.selectArray[indexPath.row] boolValue]);
    if (!(index1_ || index2_) ) {
        //刷新列表
        [tableView reloadData];
        return;
    }
    //2.判断是否互斥
    if ((indexPath.row == index1_) || (indexPath.row == index2_)) {
        //拿到所有选中的元素
        NSMutableArray *tempArray = [NSMutableArray array];
        for (int i = 0; i < self.selectArray.count; i++) {
            if ([self.selectArray[i] boolValue]) {
                [tempArray addObject:dataArray_[i]];
            }
        }
        if (indexPath.row == index1_) {
            if ([tempArray containsObject:dataArray_[index2_]]) {
                //取消选中
                self.selectArray[index2_]  = @(NO);
            }
        }
        if (indexPath.row == index2_) {
            if ([tempArray containsObject:dataArray_[index1_]]) {
                //取消选中
                self.selectArray[index1_]  = @(NO);
            }
        }
    }
    
    //刷新列表
    [tableView reloadData];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     completeBlock_(@[]);
    [self deleteAll];
}
- (void)cancleBtnAction:(UIButton *)button {
    completeBlock_(@[]);
    [self deleteAll];
}
//点击了确定
- (void)confirmBtnAction:(UIButton *)button {
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0; i < self.selectArray.count; i++) {
        if ([self.selectArray[i] boolValue]) {
            [tempArray addObject:dataArray_[i]];
        }
    }
    completeBlock_(tempArray);
    [self deleteAll];
    
}
-(void)deleteAll{
    index2_ = 0;
    index1_ = 0;
    didDataArray_ = nil;
    title_ = nil;
    completeBlock_ = nil;
    [tableView_ removeFromSuperview];;
    dataArray_ = nil;
    
    [self removeFromSuperview];
}
@end
