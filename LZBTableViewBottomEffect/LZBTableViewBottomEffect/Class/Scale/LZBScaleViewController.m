//
//  LZBScaleViewController.m
//  LZBTableViewBottomEffect
//
//  Created by apple on 16/7/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LZBScaleViewController.h"
#import "LZBTableView.h"
#import "LZBArrayDataSource.h"
#import "LZBScaleCellModel.h"
#import "LZBScaleTableViewCell.h"

#define naviView_Height 64
static NSString  *LZBScaleTableViewCellID = @"LZBScaleTableViewCellID";
static NSString  *nomalCellID = @"nomalCellID";
@interface LZBScaleViewController ()<UITableViewDelegate>

@property (nonatomic, strong) LZBTableView *tableView;
@property (nonatomic, strong) NSMutableArray<LZBScaleCellModel *> *cellItems;
@property (nonatomic, strong) LZBArrayDataSource *dataSource;
@property (nonatomic, strong) NSMutableArray <LZBArrayDataSourceSectionObject *>*sectionArray;

@end

@implementation LZBScaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"上拉放大效果";
    [self setupTableView];
      
}

- (void)setupTableView
{
    [self.view addSubview:self.tableView];
    self.dataSource = [[LZBArrayDataSource alloc]initWithSectionItems:self.sectionArray cellIdentifiers:@[nomalCellID,LZBScaleTableViewCellID] configCellBlock:^(id cell, id item, NSInteger section) {
        if(section == 0)
        {
            UITableViewCell *callBackCell = (UITableViewCell *)cell;
            LZBScaleCellModel *model =  (LZBScaleCellModel *)item;
            callBackCell.textLabel.text = model.title;
        }
        else
        {
            LZBScaleTableViewCell *callBackCell = (LZBScaleTableViewCell *)cell;
            LZBScaleCellModel *model =  (LZBScaleCellModel *)item;
            callBackCell.model = model;
        }
    }];
    self.tableView.dataSource = self.dataSource;
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
        return 44;
    else
        return  [LZBScaleTableViewCell getScaleTableViewCellHeight];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self pullUpBottomViewScaleWithScrollView:scrollView];
}

- (void)pullUpBottomViewScaleWithScrollView:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.y -(scrollView.contentSize.height - ([UIScreen mainScreen].bounds.size.height -naviView_Height));
    if(offset > 0)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.dataSource itemSectionObjectWithIndexPathSection:self.sectionArray.count -1].items.count-1 inSection:self.sectionArray.count -1];
        LZBScaleTableViewCell *cell =[self.tableView cellForRowAtIndexPath:indexPath];
        CGFloat percent =  1 + offset/[LZBScaleTableViewCell getScaleTableViewCellHeight];
        CGRect cellFrame = cell.coverImageView.bounds;
        CGPoint cellCenter = cell.coverImageView.center;
        cellCenter.x = cellCenter.x;
        cellCenter.y = ([LZBScaleTableViewCell getScaleTableViewCellHeight] + offset ) * 0.5;
        cellFrame.size.width = [UIScreen mainScreen].bounds.size.width * percent;
        cellFrame.size.height = [LZBScaleTableViewCell getScaleTableViewCellHeight] * percent;
        cell.coverImageView.center = cellCenter;
        cell.coverImageView.bounds = cellFrame;
      
    }
}


#pragma mark - 懒加载 - data
- (LZBTableView *)tableView
{
    if(_tableView == nil)
    {
        _tableView = [[LZBTableView alloc]initWithFrame:CGRectMake(0, naviView_Height,self.view.bounds.size.width , self.view.bounds.size.height-naviView_Height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        [_tableView registerClass:[LZBScaleTableViewCell class] forCellReuseIdentifier:LZBScaleTableViewCellID];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:nomalCellID];
    }
    return _tableView;
}

- (NSMutableArray<LZBScaleCellModel *> *)cellItems
{
  if(_cellItems == nil)
  {
      _cellItems = [NSMutableArray array];
      
      for(NSInteger i = 0; i < 10; i++)
      {
          LZBScaleCellModel *model = [[LZBScaleCellModel alloc]init];
          model.title = (i==9)?@"test-我是寒冰射手-上拉放大":@"test-我是剑圣-无极剑道";
          model.coverImage =(i==9)?[UIImage imageNamed:@"hangbing"]:[UIImage imageNamed:@"jingsheng"];
          [_cellItems addObject:model];
      }
  }
    return _cellItems;
}

- (NSMutableArray<LZBArrayDataSourceSectionObject *> *)sectionArray
{
  if(_sectionArray == nil)
  {
      _sectionArray = [NSMutableArray array];
      NSMutableArray *array = [NSMutableArray array];
      for (NSInteger i= 0; i<5; i++) {
          LZBScaleCellModel *model = [[LZBScaleCellModel alloc]init];
          model.title =[NSString stringWithFormat:@"不同的cell-第%ld个",i];
          [array addObject:model];
      }
      LZBArrayDataSourceSectionObject *model1 =[[LZBArrayDataSourceSectionObject alloc]init];
      model1.headerTitle = @"第一个头部";
      model1.footerTilte = nil;
      [model1.items addObjectsFromArray:array];
      [_sectionArray addObject:model1];
      LZBArrayDataSourceSectionObject *model2 =[[LZBArrayDataSourceSectionObject alloc]init];
      model2.headerTitle =@"第二个头部";
      model2.footerTilte = nil;
      [model2.items addObjectsFromArray:self.cellItems];
      [_sectionArray addObject:model2];
  }
    return _sectionArray;
}



@end
