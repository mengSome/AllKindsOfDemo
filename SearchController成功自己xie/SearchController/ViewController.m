//
//  ViewController.m
//  SearchController
//
//  Created by Mr.Gu on 16/6/16.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate,UISearchResultsUpdating>
//原始数据
@property (nonatomic, strong) NSArray *dataArray;
//search控制器
@property (nonatomic, strong) UISearchController *searchController;
//tableView
@property (nonatomic, strong) UITableView *tableView;
@property(strong, nonatomic) NSMutableArray *searchDataSource; // 根据searchController搜索的城市

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    
    self.searchController.searchResultsUpdater = self;
    [self.searchController.searchBar sizeToFit];
    
    [self.view addSubview: self.tableView];
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
    // 设置为NO,可以点击搜索出来的内容
    self.searchController.dimsBackgroundDuringPresentation = NO;
}
- (NSMutableArray *)searchDataSource{
    if (_searchDataSource == nil) {
        _searchDataSource = [NSMutableArray array];
    }
    return _searchDataSource;
}

- (NSArray *)dataArray{
    if (_dataArray == nil) {
        NSMutableArray *tempArray = [NSMutableArray array];
        for (int i = 0 ; i< 100; i ++) {
            NSString *number = [NSString stringWithFormat:@"%d",i];
            [tempArray addObject:number];
        }
        _dataArray = tempArray.copy;
    }
    return _dataArray;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.searchController.active){
        return self.searchDataSource.count;
    }
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    if (self.searchController.active) {
        cell.textLabel.text = self.searchDataSource[indexPath.row];

    }else{
        cell.textLabel.text = self.dataArray[indexPath.row];
    }
    
    return cell;
}
#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    [self.searchDataSource removeAllObjects];
    
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchController.searchBar.text];
    self.searchDataSource = [[self.dataArray filteredArrayUsingPredicate:searchPredicate] mutableCopy];
    NSLog(@"%@",self.searchDataSource);
    NSLog(@"当前线程为%@",[NSThread currentThread]);
    [self.tableView reloadData];
}
@end

