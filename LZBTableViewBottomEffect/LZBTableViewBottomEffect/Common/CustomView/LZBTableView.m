//
//  LZBTableView.m
//  LZBTableViewBottomEffect
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LZBTableView.h"

@implementation LZBTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
  if(self = [super initWithFrame:frame style:style])
  {
      self.backgroundColor = [UIColor clearColor];
      self.separatorStyle = UITableViewCellSeparatorStyleNone;
  }
    return self;
}


@end
