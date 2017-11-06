//
//  MyTableViewController.m
//  Cell展开
//
//  Created by XYJ on 2017/5/17.
//  Copyright © 2017年 海角七梦. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyViewCell.h"
@interface MyTableViewController ()
//自定义一个数组记录点击的cell
@property (nonatomic,strong) NSMutableArray *selectArray;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _selectArray = [NSMutableArray array];//每个内容都进行赋值
    _dataArray = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
      
        NSString *string = [NSString stringWithFormat:@"%zd我有一头小毛驴,我整天也不骑,有一天我心血来潮骑它去上街,我手里拿着小皮鞭我心里正得意不知怎么哗啦啦啦我摔了一身泥,donkey donkey I beg you please don't sing hiha I shall feed you I shall feed you please don't sing hiha  hiha hiha hiha hiha why you sing so well I shall feed you I shall feed you please don't sing hiha",i];
        [_dataArray addObject:string];
        [_selectArray addObject:@(NO)];
        [self.tableView reloadData];
    }
  //首先给cell一个可变的固定高度
        self.tableView.rowHeight = UITableViewAutomaticDimension;//这句话很重要
    self.tableView.estimatedRowHeight = 80;//这个其实没啥用,高度可以随便设置,但是不能缺少
//    [self.tableView registerClass:[MyViewCell class] forCellReuseIdentifier:@"cell"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//重新计算cell的高度
    BOOL indexx = [self.selectArray[indexPath.row] boolValue];
    if (indexx) {
        return tableView.rowHeight;
    }else{
        return 80;
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.contectLabel.text = _dataArray[indexPath.row];
    cell.myImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"timg%zd",indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//cell 点击事件中进行事件的进行
    BOOL index = [self.selectArray[indexPath.row] boolValue];
    index = !index;
    self.selectArray [indexPath.row] = @(index);
    [self.tableView reloadData];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
