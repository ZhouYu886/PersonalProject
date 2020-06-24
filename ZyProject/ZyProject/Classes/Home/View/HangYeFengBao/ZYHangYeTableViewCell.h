//
//  ZYHangYeTableViewCell.h
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ZYHangYeFBM;
@interface ZYHangYeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *BiaoTi;
@property (weak, nonatomic) IBOutlet UILabel *NeiRong;

@property(nonatomic,strong)ZYHangYeFBM *Hm;
@end

NS_ASSUME_NONNULL_END
