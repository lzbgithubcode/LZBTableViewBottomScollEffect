//
//  LZBBaseTableViewController.m
//  LZBTableViewBottomEffect
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LZBBaseTableViewController.h"

#define KSFirstSection_CellID  @"FirstSection_CellID"  //第一组CellID
#define KSTwoSection_CellID  @"TwoSection_CellID"      //第二组CellID
#define KSThreeSection_CellID  @"ThreeSection_CellID"  //第三组CellID
@interface LZBBaseTableViewController ()

@end

@implementation LZBBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
   
}

#pragma mark - tableViewDataSource
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//   
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld组第%ld行",indexPath.section,indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


- (LZBTableView *)tableView
{
    if(_tableView == nil)
    {
        _tableView = [[LZBTableView alloc]initWithFrame:CGRectMake(0, 64,self.view.bounds.size.width , self.view.bounds.size.height -64) style:UITableViewStylePlain];
        _tableView.dataSource =self;
        _tableView.delegate = self;
    }
    return _tableView;
}
@end
