//
//  LZBScaleTableViewCell.h
//  LZBTableViewBottomEffect
//
//  Created by apple on 16/7/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZBScaleCellModel.h"

@interface LZBScaleTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) LZBScaleCellModel *model;

+ (CGFloat)getScaleTableViewCellHeight;
@end
