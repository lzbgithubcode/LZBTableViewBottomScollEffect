//
//  LZBScaleTableViewCell.m
//  LZBTableViewBottomEffect
//
//  Created by apple on 16/7/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LZBScaleTableViewCell.h"

@interface LZBScaleTableViewCell()


@property (nonatomic, strong) UILabel *titleLab;

@end

@implementation LZBScaleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
   {
       self.selectionStyle = UITableViewCellSelectionStyleNone;
       [self.contentView addSubview:self.coverImageView];
       [self.contentView addSubview:self.titleLab];
   }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.coverImageView.frame = self.contentView.bounds;
    self.titleLab.center = self.contentView.center;
    self.titleLab.bounds = CGRectMake(0, 0,self.contentView.bounds.size.width , 40);
}
- (void)setModel:(LZBScaleCellModel *)model
{
    if(model == nil) return;
    _model = model;
    self.coverImageView.image = model.coverImage;
    self.titleLab.text = model.title;
}


+ (CGFloat)getScaleTableViewCellHeight
{
    return [UIScreen mainScreen].bounds.size.width * 0.6;
}

#pragma mark - 懒加载
- (UIImageView *)coverImageView
{
  if(_coverImageView == nil)
  {
      _coverImageView = [UIImageView new];
  }
    return _coverImageView;
}

- (UILabel *)titleLab
{
  if(_titleLab == nil)
  {
      _titleLab = [UILabel new];
      _titleLab.textColor = [UIColor whiteColor];
      _titleLab.font = [UIFont boldSystemFontOfSize:18.0];
      _titleLab.textAlignment = NSTextAlignmentCenter;
  }
    return _titleLab;
}



@end
