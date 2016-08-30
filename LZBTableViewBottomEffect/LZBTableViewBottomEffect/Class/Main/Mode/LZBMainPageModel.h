//
//  LZBMainPageModel.h
//  LZBTableViewBottomEffect
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LZBtableViewPullUpEffectType)
{
    LZBtableViewPullUpEffectType_PullUpScale,  //上拉放大
    LZBtableViewPullUpEffectType_PullUptranslation,  //上拉平移
    LZBtableViewPullUpEffectType_PullDownScale,  //上拉平移

};

@interface LZBMainPageModel : NSObject

@property (nonatomic, strong) NSString *viewControllerName;
@property (nonatomic, strong) NSString *viewControllerTitle;
@property (nonatomic, assign) LZBtableViewPullUpEffectType type;

@end
