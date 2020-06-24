//
//  HWRollingView.h
//  lixise
//
//  Created by 李含文 on 17/3/2.
//  Copyright © 2017年 SK丿希望. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, RollingStyle){ // 滚动样式
    RollingStyleLocal, // 本地 根据图片名加载
    RollingStyleNetwork // 网络 根据URL下载
};
@interface HWRollingView : UIView
/**
 frame: 
 style:   滚动图样式 (RollingStyleLocal:本地 RollingStyleNetwork:网络)
 data:   数组 (样式为本地:传入图片名 网络:传入url数组)
 action: 点击图片的回调
 */
+ (instancetype)rollingViewWithFrame:(CGRect)frame RollingStyle:(RollingStyle)style Data:(NSArray *)data action:(void(^)(NSInteger index))action;
@end
