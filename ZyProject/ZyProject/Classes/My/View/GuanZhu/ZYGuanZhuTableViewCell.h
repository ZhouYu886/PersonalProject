//
//  ZYGuanZhuTableViewCell.h
//  ZyProject
//
//  Created by apple on 2020/6/19.
//  Copyright © 2020 123123. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZYGuanZhuDelegate <NSObject>

@optional

-(void)BuZaiGuanZhu;

@end
@interface ZYGuanZhuTableViewCell : UITableViewCell

@property(weak,nonatomic)id<ZYGuanZhuDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
