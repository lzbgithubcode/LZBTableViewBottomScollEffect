//
//  LZBBaseTableViewController.h
//  LZBTableViewBottomEffect
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZBTableView.h"

@interface LZBBaseTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) LZBTableView *tableView;
@end
