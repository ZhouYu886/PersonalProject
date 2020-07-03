//
//  ZYTuiJianTableViewCell.h
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ZYSheQuM,ZYSheQuB,ZYTuiJianTableViewCell;
@protocol ZYTuiJianDelegate <NSObject>

@optional

-(void)clickBtn:(ZYTuiJianTableViewCell *)cell;


@end


@interface ZYTuiJianTableViewCell : UITableViewCell

@property(nonatomic,strong)ZYSheQuM *SqM;

@property (weak, nonatomic) IBOutlet UIView *XView;

@property(nonatomic,weak)id<ZYTuiJianDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
