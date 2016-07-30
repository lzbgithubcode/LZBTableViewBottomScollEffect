//
//  LZBArrayDataSource.m
//  LZBTableViewBottomEffect
//
//  Created by apple on 16/7/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LZBArrayDataSource.h"


@implementation LZBArrayDataSourceSectionObject
- (instancetype)init
{
  if(self =[super init])
  {
     self.footerTilte = @"";
     self.headerTitle =@"";
     self.items = [NSMutableArray array];
  }
    return self;
}

@end

@interface LZBArrayDataSource()
@property (nonatomic, strong) NSArray <LZBArrayDataSourceSectionObject *>*sectionItems;
@property (nonatomic, strong) NSArray <NSString *>*cellIdentifiers;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy)   NSString *cellIdentifier;
@property (nonatomic, copy) configCellBlock configCellBlock;



@end

@implementation LZBArrayDataSource


- (instancetype)initWithSectionItems:(NSArray<LZBArrayDataSourceSectionObject *> *)sectionItems
                      cellIdentifiers:(NSArray *)cellIdentifiers
                     configCellBlock:(configCellBlock)configCellBlock
{
    if(self = [super init])
    {
        self.sectionItems = sectionItems;
        self.cellIdentifiers = cellIdentifiers;
        self.configCellBlock =  [configCellBlock copy];;
    }
    return self;
}
- (instancetype)initWithItems:(NSArray *)items
               cellIdentifier:(NSString *)cellIdentifier
              configCellBlock:(configCellBlock)configCellBlock
{
   if(self = [super init])
   {
       self.items =items;
       self.cellIdentifier =cellIdentifier;
       self.configCellBlock = [configCellBlock copy];
   }
    return self;
}

- (id)itemWithIndexPath:(NSIndexPath *)indexPath
{
    if(self.sectionItems.count > 0)
       return [[self itemSectionArrayWithIndexPathSection:indexPath.section] objectAtIndex:indexPath.row];
    else
       return [self.items objectAtIndex:indexPath.row];
}

- (LZBArrayDataSourceSectionObject *)itemSectionObjectWithIndexPathSection:(NSInteger)section
{
    return [self.sectionItems objectAtIndex:section];
}

- (NSArray *)itemSectionArrayWithIndexPathSection:(NSInteger)section
{
   LZBArrayDataSourceSectionObject *objects = [self itemSectionObjectWithIndexPathSection:section];
    if(objects.items.count > 0)
        return objects.items;
    else
        return nil;
    
}

#pragma mark - UITableViewDataSource - required
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionItems.count?self.sectionItems.count:1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.sectionItems.count > 0)
        return [self itemSectionArrayWithIndexPathSection:section].count;
    else
        return self.items.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if(self.sectionItems.count > 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifiers[indexPath.section]];
        NSArray *items = [self itemSectionArrayWithIndexPathSection:indexPath.section];
        if(items.count > 0)
            self.configCellBlock(cell,items[indexPath .row],indexPath.section);
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
        if(self.items.count > 0)
            self.configCellBlock(cell,self.items[indexPath.row],indexPath.section);
    }
   
    return cell;
}

#pragma mark -UITableViewDataSource - Optional
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
   LZBArrayDataSourceSectionObject *obj=[self itemSectionObjectWithIndexPathSection:section];
    return obj.footerTilte;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    LZBArrayDataSourceSectionObject *obj=[self itemSectionObjectWithIndexPathSection:section];
    return obj.headerTitle;
}

@end
