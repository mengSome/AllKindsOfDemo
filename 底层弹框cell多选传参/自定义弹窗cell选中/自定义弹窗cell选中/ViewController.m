//
//  ViewController.m
//  自定义弹窗cell选中
//
//  Created by XYJ on 2017/5/12.
//  Copyright © 2017年 海角七梦. All rights reserved.
//

#import "ViewController.h"
#import "ZHMultiSelectView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 300) style:(UITableViewStylePlain)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (IBAction)touchAction:(id)sender {
    NSArray *array = @[@"告白气球",@"听妈妈的话",@"以父之名",@"借口",@"一路向北",@"轨迹",@"噼里啪啦小魔仙"];
    [ZHMultiSelectView createMultiSelectViewWithTitle:@"选择想要的数组" andDataArray:array completeSelect:^(NSArray *selectArray) {
        NSLog(@"这是我想要的数组:%@",selectArray);
        _dataArray = selectArray;
        [_tableView reloadData];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
