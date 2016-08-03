//
//  LZBTranslationViewController.m
//  LZBTableViewBottomEffect
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LZBTranslationViewController.h"

@interface LZBTranslationViewController ()

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
    return tempArray;
}





@end
