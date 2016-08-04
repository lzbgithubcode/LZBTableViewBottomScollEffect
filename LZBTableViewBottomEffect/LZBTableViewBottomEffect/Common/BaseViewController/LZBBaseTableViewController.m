//
//  LZBBaseTableViewController.m
//  LZBTableViewBottomEffect
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LZBBaseTableViewController.h"


@implementation LZBTableViewSectionModel
@end

@interface LZBBaseTableViewController ()


@property (nonatomic, strong) NSMutableArray <NSString *>*cellIDKeys;
@end

@implementation LZBBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    self.sections = [self getAllSectionModels];
    [self registerCellClass];
   
}
- (void)registerCellClass
{
    for (NSInteger i = 0; i < self.sections.count; i++) {
        LZBTableViewSectionModel *model = self.sections[i];
        [self.tableView registerClass:model.cellClass forCellReuseIdentifier:[self cellIDForType:model.sectionType]];
    }
}

#pragma mark - tableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return [self lzb_numberOfSectionsInTableView:tableView WithSections:self.sections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    LZBTableViewSectionModel *sectionModel = [self getSectionModelWithSection:section];
    return [self lzb_tableView:tableView numberOfRowsInSection:section withSectionModel:sectionModel];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZBTableViewSectionModel *sectionModel = [self getSectionModelWithSection:indexPath.section];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self cellIDForType:sectionModel.sectionType]];
    switch (sectionModel.sectionType)
    {
        case LZBTableViewSectionType_First:
            cell = [self lzb_first_tableView:tableView cellForRowAtIndexPath:indexPath withSectionModel:sectionModel WithCell:cell];
            break;
        case LZBTableViewSectionType_Two:
             cell = [self lzb_two_tableView:tableView cellForRowAtIndexPath:indexPath withSectionModel:sectionModel WithCell:cell];
            break;
        case LZBTableViewSectionType_Three:
             cell = [self lzb_three_tableView:tableView cellForRowAtIndexPath:indexPath withSectionModel:sectionModel WithCell:cell];
            break;
        case LZBTableViewSectionType_Four:
             cell = [self lzb_four_tableView:tableView cellForRowAtIndexPath:indexPath withSectionModel:sectionModel WithCell:cell];
            break;
            
        default:
            break;
    }
    
    if(cell == nil)
    {
       cell = [[UITableViewCell alloc]init];
       cell.textLabel.text = @"cell为空，这个是占位Cell";
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LZBTableViewSectionModel *sectionModel = [self getSectionModelWithSection:section];
    return [self lzb_tableView:tableView viewForHeaderInSection:section withSectionModel:sectionModel];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    LZBTableViewSectionModel *sectionModel = [self getSectionModelWithSection:section];
    return [self lzb_tableView:tableView viewForHeaderInSection:section withSectionModel:sectionModel];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
   LZBTableViewSectionModel *sectionModel = [self getSectionModelWithSection:section];
    return sectionModel.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    LZBTableViewSectionModel *sectionModel = [self getSectionModelWithSection:section];
    return sectionModel.footerTitle;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    LZBTableViewSectionModel *sectionModel = [self getSectionModelWithSection:section];
    return [self lzb_tableView:tableView heightForFooterInSection:section withSectionModel:sectionModel];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    LZBTableViewSectionModel *sectionModel = [self getSectionModelWithSection:section];
    return [self lzb_tableView:tableView heightForHeaderInSection:section withSectionModel:sectionModel];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     LZBTableViewSectionModel *sectionModel = [self getSectionModelWithSection:indexPath.section];
    return [self lzb_tableView:tableView heightForRowAtIndexPath:indexPath withSectionModel:sectionModel];
}

#pragma mark - 自定义

- (UITableViewCell *)lzb_first_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withSectionModel:(LZBTableViewSectionModel *)sectionModel WithCell:(UITableViewCell *)cell
{
    return cell;
}

- (UITableViewCell *)lzb_two_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withSectionModel:(LZBTableViewSectionModel *)sectionModel WithCell:(UITableViewCell *)cell
{
    return cell;
}

- (UITableViewCell *)lzb_three_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withSectionModel:(LZBTableViewSectionModel *)sectionModel WithCell:(UITableViewCell *)cell
{
    return cell;
}

- (UITableViewCell *)lzb_four_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withSectionModel:(LZBTableViewSectionModel *)sectionModel WithCell:(UITableViewCell *)cell
{
    return cell;
}


- (NSInteger)lzb_numberOfSectionsInTableView:(UITableView *)tableView WithSections:(NSMutableArray<LZBTableViewSectionModel *> *)sections
{
    return 1;
}

- (CGFloat)lzb_tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath withSectionModel:(LZBTableViewSectionModel *)sectionModel
{
    return 44;
}
- (NSInteger)lzb_tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section withSectionModel:(LZBTableViewSectionModel *)sectionModel
{
    return 1;
}

- (UIView *)lzb_tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section withSectionModel:(LZBTableViewSectionModel *)sectionModel
{
    return nil;
}
- (UIView *)lzb_tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section withSectionModel:(LZBTableViewSectionModel *)sectionModel
{
    return nil;
}

- (CGFloat)lzb_tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section withSectionModel:(LZBTableViewSectionModel *)sectionModel
{
    return CGFLOAT_MIN;
}
- (CGFloat)lzb_tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section withSectionModel:(LZBTableViewSectionModel *)sectionModel
{
    return CGFLOAT_MIN;
}

#pragma mark - private

- (LZBTableViewSectionModel *)getSectionModelWithSection:(NSInteger)section
{
    if(self.sections.count > section)
        return [self.sections objectAtIndex:section];
    else
       return nil;
}

- (NSArray *)getItemsWithSection:(NSInteger)section
{
    LZBTableViewSectionModel *sectionModel = [self getSectionModelWithSection:section];
    return sectionModel.tableViewRowArray;
}

- (NSString *)cellIDForType:(LZBTableViewSectionType)type
{
    if(type < self.sections.count)
    {
        LZBTableViewSectionModel *sectionModel = [self getSectionModelWithSection:type];
       return [NSString stringWithFormat:@"LZBBaseTableViewControllerCell%ldID",sectionModel.sectionType];
    }
    else
        return @"";
    
}

#pragma mark - 懒加载

- (NSMutableArray<LZBTableViewSectionModel *> *)getAllSectionModels
{
    NSMutableArray *tempArray = [NSMutableArray array];
    return tempArray;
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

- (NSMutableArray<LZBTableViewSectionModel *> *)sections
{
  if(_sections == nil)
  {
      _sections = [NSMutableArray array];
  }
    return _sections;
}

@end
