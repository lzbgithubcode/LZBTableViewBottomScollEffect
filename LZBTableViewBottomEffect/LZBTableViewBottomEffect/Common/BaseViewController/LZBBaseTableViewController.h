//
//  LZBBaseTableViewController.h
//  LZBTableViewBottomEffect
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZBTableView.h"
#import "LZBScaleTableViewCell.h"

typedef NS_ENUM(NSInteger,LZBTableViewSectionType)
{
   LZBTableViewSectionType_First,
   LZBTableViewSectionType_Two,
   LZBTableViewSectionType_Three,
   LZBTableViewSectionType_Four,

};

@interface LZBTableViewSectionModel : NSObject
@property (nonatomic, strong) NSMutableArray *tableViewRowArray;
@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *footerTitle;
@property (nonatomic, assign) LZBTableViewSectionType sectionType;
@property (nonatomic, strong) Class cellClass;
@end

#pragma mark - VC
@interface LZBBaseTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) LZBTableView *tableView;
//必须重写的方法
/**
 *  返回组数+每一组的模型
 *
 *  @return 
 */
-(NSMutableArray <LZBTableViewSectionModel *>*)getAllSectionModels;

//方法
-(NSInteger)lzb_tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section withSectionModel:(LZBTableViewSectionModel *)sectionModel;

-(UITableViewCell *)lzb_first_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withSectionModel:(LZBTableViewSectionModel *)sectionModel WithCell:(UITableViewCell *)cell;


-(UITableViewCell *)lzb_two_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withSectionModel:(LZBTableViewSectionModel *)sectionModel WithCell:(UITableViewCell *)cell;


-(UITableViewCell *)lzb_three_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withSectionModel:(LZBTableViewSectionModel *)sectionModel WithCell:(UITableViewCell *)cell;


-(UITableViewCell *)lzb_four_tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withSectionModel:(LZBTableViewSectionModel *)sectionModel WithCell:(UITableViewCell *)cell;

- (CGFloat)lzb_tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath  withSectionModel:(LZBTableViewSectionModel *)sectionModel;

- (NSInteger)lzb_numberOfSectionsInTableView:(UITableView *)tableView WithSections:(NSMutableArray <LZBTableViewSectionModel *>*)sections;

//头部和底部
- (UIView *)lzb_tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section withSectionModel:(LZBTableViewSectionModel *)sectionModel;

- (UIView *)lzb_tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section withSectionModel:(LZBTableViewSectionModel *)sectionModel;

- (CGFloat)lzb_tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section withSectionModel:(LZBTableViewSectionModel *)sectionModel;

- (CGFloat)lzb_tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section  withSectionModel:(LZBTableViewSectionModel *)sectionModel;

@end
