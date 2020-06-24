//
//  ZYBiXiangQingTableViewCell.h
//  ZyProject
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 123123. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYBiXiangQingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *Image;
@property (weak, nonatomic) IBOutlet UILabel *BiZhongLabel;
@property (weak, nonatomic) IBOutlet UILabel *JiaGeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ShouYiLabel;
@property (weak, nonatomic) IBOutlet UILabel *GunagChiSuanLabel;
@property (weak, nonatomic) IBOutlet UILabel *QuanWangSuan;
@property (weak, nonatomic) IBOutlet UILabel *KuangJiShu;

@end

NS_ASSUME_NONNULL_END
