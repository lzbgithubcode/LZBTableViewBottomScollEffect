//
//  LZBPullDownScalViewController.m
//  LZBTableViewBottomEffect
//
//  Created by zibin on 16/8/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LZBPullDownScalViewController.h"
#import "LZBTableView.h"
#import "LZBScaleTableViewCell.h"
#import "LZBArrayDataSource.h"
#import "LZBScaleCellModel.h"
#define naviView_Height 64
static NSString  *LZBScaleTableViewCellID = @"LZBScaleTableViewCellID";

@interface LZBPullDownScalViewController()<UITableViewDelegate>

@property (nonatomic, strong) LZBTableView *tableView;

@property (nonatomic, strong) NSMutableArray <LZBScaleCellModel *>*items;
@property (nonatomic, strong)  LZBArrayDataSource *dataSource;
@end

@implementation LZBPullDownScalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"下拉放大";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupTableView];
    
}

- (void)setupTableView
{
   self.dataSource = [[LZBArrayDataSource alloc]initWithItems:self.items cellIdentifier:LZBScaleTableViewCellID configCellBlock:^(id cell, id item, NSInteger secrtion) {
       LZBScaleTableViewCell *backCell = (LZBScaleTableViewCell*)cell;
       LZBScaleCellModel *model =  (LZBScaleCellModel *)item;
       backCell.model = model;
   }];
    self.tableView.dataSource = self.dataSource;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return [LZBScaleTableViewCell getScaleTableViewCellHeight];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   //下拉放大
    [self pullDownScrollScaleWithScrollView:scrollView];
}
- (void)pullDownScrollScaleWithScrollView:(UIScrollView *)scrollView
{
   if(scrollView.contentOffset.y < 0)
   {
       //获取第一个cell
       LZBScaleTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
       CGFloat cellHeight = [LZBScaleTableViewCell getScaleTableViewCellHeight];
       //获得offset
       CGFloat offset = -scrollView.contentOffset.y;
       CGFloat percent = (offset + cellHeight)/cellHeight;
       //获得cell的尺寸
       CGRect cellFrame = cell.coverImageView.frame;
       CGPoint cellCenter = cell.coverImageView.center;
       cellFrame.size.width = [UIScreen mainScreen].bounds.size.width *percent;
       cellFrame.size.height = cellHeight *percent;
       cellCenter.x = cellCenter.x;
       cellCenter.y = cellHeight * 0.5 + scrollView.contentOffset.y * 0.5;
       cell.coverImageView.center = cellCenter;
       cell.coverImageView.bounds = cellFrame;
   }
}

#pragma mark - set/get
- (LZBTableView *)tableView
{
  if(_tableView == nil)
  {
      _tableView = [[LZBTableView alloc]initWithFrame:CGRectMake(0, naviView_Height,self.view.bounds.size.width, self.view.bounds.size.height-naviView_Height) style:UITableViewStylePlain];
      _tableView.delegate = self;
      [_tableView registerClass:[LZBScaleTableViewCell class] forCellReuseIdentifier:LZBScaleTableViewCellID];
      [self.view addSubview:self.tableView];
  }
    return _tableView;
}

- (NSMutableArray<LZBScaleCellModel *> *)items
{
  if(_items == nil)
  {
      _items = [NSMutableArray array];
      for (NSInteger i = 0; i < 5; i++) {
          LZBScaleCellModel *model = [[LZBScaleCellModel alloc]init];
          model.coverImage = [UIImage imageNamed:@"hangbing"];
          model.title = @"下拉放大";
          [_items addObject:model];
      }
  }
    return _items;
}




@end
