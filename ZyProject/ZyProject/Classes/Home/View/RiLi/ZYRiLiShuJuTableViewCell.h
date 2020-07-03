//
//  ZYRiLiShuJuTableViewCell.h
//  ZyProject
//
//  Created by apple on 2020/6/19.
//  Copyright © 2020 123123. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ZYRLModel,ZYGQModel;
@interface ZYRiLiShuJuTableViewCell : UITableViewCell
@property(nonatomic,strong)ZYRLModel *RLM;
@property (weak, nonatomic) IBOutlet UIImageView *GuoQi;
@property(nonatomic,strong)ZYGQModel *GuoQiM;
@end

NS_ASSUME_NONNULL_END
