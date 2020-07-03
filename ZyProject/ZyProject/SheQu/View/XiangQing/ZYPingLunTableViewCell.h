//
//  ZYPingLunTableViewCell.h
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ZYSheQuM,ZYPingLunTableViewCell;
@protocol ZYPingLunDelegate <NSObject>

@optional

-(void)pingbi:(ZYPingLunTableViewCell *)cell;

@end

@interface ZYPingLunTableViewCell : UITableViewCell

@property(nonatomic,strong)ZYSheQuM *SM;

@property(nonatomic,weak)id<ZYPingLunDelegate>delegate;

@end

NS_ASSUME_NONNULL_END

