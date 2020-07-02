//
//  ZYTaRenDtHeader.h
//  ZyProject
//
//  Created by apple on 2020/6/30.
//  Copyright © 2020 123123. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class userModel;

@interface ZYTaRenDtHeader : UIView
@property (weak, nonatomic) IBOutlet UIImageView *TxImage;
@property (weak, nonatomic) IBOutlet UILabel *namelabel;
@property (weak, nonatomic) IBOutlet UILabel *GeXingQianMing;
@property (weak, nonatomic) IBOutlet UILabel *Dongtai;
@property (weak, nonatomic) IBOutlet UILabel *FenSilabel;
@property (weak, nonatomic) IBOutlet UILabel *GuanZhuLabel;
@property (weak, nonatomic) IBOutlet UILabel *GXQm;

@property(nonatomic,strong)userModel *UM;
@end

NS_ASSUME_NONNULL_END
