//
//  ZYGuanZhuTableViewCell.h
//  ZyProject
//
//  Created by apple on 2020/6/19.
//  Copyright © 2020 123123. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class userModel,ZYGuanZhuTableViewCell;

@protocol ZYGuanZhuDelegate <NSObject>

@optional

-(void)remove:(ZYGuanZhuTableViewCell *)cell;

@end

@interface ZYGuanZhuTableViewCell : UITableViewCell
@property(nonatomic,strong)userModel *UM;

@property(weak,nonatomic)id<ZYGuanZhuDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
