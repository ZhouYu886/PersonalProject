//
//  ZYZiLiaoTableViewCell.h
//  ZyProject
//
//  Created by apple on 2020/6/17.
//  Copyright © 2020 123123. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ZYKxM;
@interface ZYZiLiaoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *ShiJIan;
@property (weak, nonatomic) IBOutlet UILabel *BiaoTI;
@property (weak, nonatomic) IBOutlet UILabel *NeiRong;

@property(nonatomic,strong)ZYKxM *KxM;

@end


NS_ASSUME_NONNULL_END
