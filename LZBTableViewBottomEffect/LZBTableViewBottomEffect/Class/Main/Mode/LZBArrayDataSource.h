//
//  LZBArrayDataSource.h
//  LZBTableViewBottomEffect
//
//  Created by apple on 16/7/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import<UIKit/UIKit.h>


@interface LZBArrayDataSourceSectionObject :NSObject

@property (nonatomic, copy) NSString *headerTitle;
@property (nonatomic, copy) NSString *footerTilte;
@property (nonatomic, strong) NSMutableArray *items;

@end


typedef void(^configCellBlock)(id cell, id item, NSInteger section);

@interface LZBArrayDataSource : NSObject <UITableViewDataSource>

/**
 *  初始化tablView数据源
 *
 *  @param items           数据源-数组(这个只适用于只有1组的模型)
 *  @param cellIdentifier  cellID-唯一标识
 *  @param configCellBlock  配置cell回调
 *
 *  @return
 */
- (instancetype)initWithItems:(NSArray *)items
               cellIdentifier:(NSString *)cellIdentifier
              configCellBlock:(configCellBlock)configCellBlock;

/**
 *   初始化tablView数据源
 *
 *  @param sectionItems    多组数组(数组里面的数组)
 *  @param cellIdentifier  cellID-唯一标识
 *  @param configCellBlock 配置cell回调
 *
 *  @return
 */
- (instancetype)initWithSectionItems:(NSArray<LZBArrayDataSourceSectionObject *> *)sectionItems
                     cellIdentifiers:(NSArray *)cellIdentifiers
                     configCellBlock:(configCellBlock)configCellBlock;

/**
 *  获取单个cell的模型
 *
 *  @param indexPath indexPath
 *
 *  @return 
 */
- (id)itemWithIndexPath:(NSIndexPath *)indexPath;

/**
 *  获取某一个组的模型数组
 *
 *  @param section 那个组
 *
 *  @return 
 */
- (LZBArrayDataSourceSectionObject *)itemSectionObjectWithIndexPathSection:(NSInteger)section;

@end
