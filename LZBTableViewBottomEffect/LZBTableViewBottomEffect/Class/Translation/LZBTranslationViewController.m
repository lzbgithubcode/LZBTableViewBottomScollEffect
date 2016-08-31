//
//  LZBTranslationViewController.m
//  LZBTableViewBottomEffect
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LZBTranslationViewController.h"
#import "LZBScaleCellModel.h"
#import "LZBScaleTableViewCell.h"

@interface LZBTranslationViewController ()
@property (nonatomic, strong) NSMutableArray<LZBScaleCellModel *> *twoItems;
@property (nonatomic, strong) NSMutableArray<LZBScaleCellModel *> *fourItems;
@property (nonatomic, strong) LZBScaleTableViewCell *lastCell;

@end

@implementation LZBTranslationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
}

//获取数据源
- (NSMutableArray<LZBTableViewSectionModel *> *)getAllSectionModels
{

    NSMutableArray *tempArray = [NSMutableArray array];
    LZBTableViewSectionModel *model1 = [[LZBTableViewSectionModel  alloc]init];
    model1.headerTitle = @"第一组头部";
    NSMutableArray *firstArray = [NSMutableArray array];
    for (NSInteger i= 0; i <5; i++) {
        [firstArray addObject:[NSString stringWithFormat:@"第一组普通的cell-第%ld个",i]];
    }
    model1.tableViewRowArray = firstArray;
    model1.sectionType = LZBTableViewSectionType_First;
    model1.cellClass = [UITableViewCell class];
    [tempArray addObject:model1];
    
    //第二组
    LZBTableViewSectionModel *model2 = [[LZBTableViewSectionModel  alloc]init];
    model2.headerTitle = @"第二组头部";
    model2.tableViewRowArray = self.twoItems;
    model2.sectionType = LZBTableViewSectionType_Two;
    model2.cellClass = [LZBScaleTableViewCell class];
    [tempArray addObject:model2];
    
    //第三组
    LZBTableViewSectionModel *model3 = [[LZBTableViewSectionModel  alloc]init];
    model3.headerTitle = @"第三组头部";
    NSMutableArray *threeArray = [NSMutableArray array];
    for (NSInteger i= 0; i <5; i++) {
        [threeArray addObject:[NSString stringWithFormat:@"第三组普通的cell-第%ld个",i]];
    }
    model3.tableViewRowArray = threeArray;
    model3.sectionType = LZBTableViewSectionType_Three;
    model3.cellClass = [UITableViewCell class];
    [tempArray addObject:model3];
    
    //第四组
    LZBTableViewSectionModel *model4 = [[LZBTableViewSectionModel  alloc]init];
    model4.headerTitle = @"第四组头部";
    model4.tableViewRowArray = self.fourItems;
    model4.sectionType = LZBTableViewSectionType_Four;
    model4.cellClass = [LZBScaleTableViewCell class];
    [tempArray addObject:model4];
    
    return tempArray;
}
#pragma mark - tableView-dataSource
- (NSInteger)lzb_numberOfSectionsInTableView:(UITableView *)tableView WithSections:(NSMutableArray<LZBTableViewSectionModel *> *)sections
{
    return sections.count;
}

- (NSInteger)lzb_tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section withSectionModel:(LZBTableViewSectionModel *)sectionModel
{
    return sectionModel.tableViewRowArray.count;
}

- (UITableViewCell *)lzb_first_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withSectionModel:(LZBTableViewSectionModel *)sectionModel WithCell:(UITableViewCell *)cell
{
    NSString *string =  sectionModel.tableViewRowArray[indexPath.row];
    cell.textLabel.text = string;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UITableViewCell *)lzb_two_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withSectionModel:(LZBTableViewSectionModel *)sectionModel WithCell:(UITableViewCell *)cell
{
    LZBScaleTableViewCell *scaleCell = (LZBScaleTableViewCell*)cell;
    LZBScaleCellModel *model = sectionModel.tableViewRowArray[indexPath.row];
    scaleCell.model = model;
    return scaleCell;
}

- (UITableViewCell *)lzb_three_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withSectionModel:(LZBTableViewSectionModel *)sectionModel WithCell:(UITableViewCell *)cell
{
    NSString *string =  sectionModel.tableViewRowArray[indexPath.row];
    cell.textLabel.text = string;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UITableViewCell *)lzb_four_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withSectionModel:(LZBTableViewSectionModel *)sectionModel WithCell:(UITableViewCell *)cell
{
    LZBScaleTableViewCell *scaleCell = (LZBScaleTableViewCell*)cell;
    LZBScaleCellModel *model = sectionModel.tableViewRowArray[indexPath.row];
    
    if(sectionModel.tableViewRowArray.count-1  == indexPath.row)
    {
         self.lastCell = scaleCell;
    }
    scaleCell.model = model;

 
    return scaleCell;
}

- (CGFloat)lzb_tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath withSectionModel:(LZBTableViewSectionModel *)sectionModel
{
    CGFloat height = 44;
    switch (sectionModel.sectionType)
    {
        case LZBTableViewSectionType_First:
            break;
        case LZBTableViewSectionType_Two:
            height = [LZBScaleTableViewCell getScaleTableViewCellHeight];
            break;
        case LZBTableViewSectionType_Three:
            break;
        case LZBTableViewSectionType_Four:
            height = [LZBScaleTableViewCell getScaleTableViewCellHeight];
            break;
            
        default:
            break;
    }
    return height;
}

- (CGFloat)lzb_tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section withSectionModel:(LZBTableViewSectionModel *)sectionModel
{
    CGFloat height = 44;
    switch (sectionModel.sectionType)
    {
        case LZBTableViewSectionType_First:
            break;
        case LZBTableViewSectionType_Two:
            break;
        case LZBTableViewSectionType_Three:
            break;
        case LZBTableViewSectionType_Four:
            break;
            
        default:
            break;
    }
    return height;
}

#pragma mark - 上拉回弹效果
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self pullUpTranslationScrollView:scrollView];
}

- (void)pullUpTranslationScrollView:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.y -(scrollView.contentSize.height - scrollView.frame.size.height);
   if(offset >0)
   {
      //拿到最后一个cell
       LZBScaleTableViewCell *cell = self.lastCell;
       CGRect cellFrame = cell.frame;
       cellFrame.size.height = [LZBScaleTableViewCell getScaleTableViewCellHeight] + offset;
       cell.coverImageView.bounds = cellFrame;
       cell.coverImageView.center = CGPointMake(cellFrame.size.width *0.5, cellFrame.size.height *0.5);
   }
}


#pragma mark - 懒加载
- (NSMutableArray<LZBScaleCellModel *> *)twoItems
{
    if(_twoItems == nil)
    {
        _twoItems = [NSMutableArray array];
        for(NSInteger i = 0; i < 5; i++)
        {
            LZBScaleCellModel *model = [[LZBScaleCellModel alloc]init];
            model.title =@"test-我是九尾妖狐";
            model.coverImage =[UIImage imageNamed:@"ali"];
            [_twoItems addObject:model];
        }
    }
    return _twoItems;
}

- (NSMutableArray<LZBScaleCellModel *> *)fourItems
{
   if(_fourItems == nil)
   {
       _fourItems = [NSMutableArray array];
       for(NSInteger i = 0; i < 5; i++)
       {
           LZBScaleCellModel *model = [[LZBScaleCellModel alloc]init];
           model.title = (i < 4)?@"test-我是火蓝":@"火蓝的描述";
           model.coverImage =[UIImage imageNamed:@"huolan"];
           [_fourItems addObject:model];
       }
   }
    return _fourItems;
}





@end
