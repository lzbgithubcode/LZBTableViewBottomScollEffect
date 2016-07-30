//
//  ViewController.m
//  LZBTableViewBottomEffect
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "LZBMainPageModel.h"
#import "LZBTranslationViewController.h"
#import "LZBScaleViewController.h"
#define cell_Height  44
#define line_Height  1

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray <LZBMainPageModel *>*effectModels;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"主页";
    [self addMainPageModelToEffectModels];
}

#pragma mark- add model
- (void)addMainPageModelToEffectModels
{
    [self.effectModels addObject:[self creatSignleModelWithVCName:@"LZBTranslationViewController" Title:@"上拉平移回弹效果" AnimationEffect:LZBtableViewPullUpEffectType_translation]];
     [self.effectModels addObject:[self creatSignleModelWithVCName:@"LZBScaleViewController" Title:@"上拉放大效果" AnimationEffect:LZBtableViewPullUpEffectType_Scale]];
}

- (LZBMainPageModel *)creatSignleModelWithVCName:(NSString *)name Title:(NSString *)title  AnimationEffect:(LZBtableViewPullUpEffectType)type
{
    LZBMainPageModel *model = [[LZBMainPageModel alloc]init];
    model.viewControllerName =name;
    model.viewControllerTitle = title;
    model.type = type;
    return model;
}



#pragma mark- tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.effectModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *mainPageCellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainPageCellID];
    if(cell == nil)
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mainPageCellID];
    cell.textLabel.text = self.effectModels[indexPath.row].viewControllerTitle;
    if(self.effectModels.count-1 != indexPath.row)
    {
     [cell.contentView.layer addSublayer:[self getSeperatorLine]];
    }
   
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cell_Height;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LZBMainPageModel *model = self.effectModels[indexPath.row];
    Class vc = NSClassFromString(model.viewControllerName);
    [self.navigationController pushViewController:[[vc alloc]init] animated:YES];
}
- (CALayer *)getSeperatorLine
{
    CALayer *lineLayer = [CALayer new];
    lineLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    lineLayer.frame = CGRectMake(15, cell_Height -line_Height, self.view.frame.size.width-30, line_Height);
    
    return lineLayer;
}

#pragma mark-懒加载

- (NSMutableArray<LZBMainPageModel *> *)effectModels
{
  if(_effectModels == nil)
  {
      _effectModels = [NSMutableArray array];
  }
    return _effectModels;
}


@end
