//
//  ZYXYFbXQTableViewCell.h
//  ZyProject
//
//  Created by apple on 2020/6/23.
//  Copyright © 2020 123123. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ZYHangYeFBM;

@interface ZYXYFbXQTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *biaoTI;
@property (weak, nonatomic) IBOutlet UILabel *neirong;
@property (weak, nonatomic) IBOutlet UIImageView *Tp;

@property(nonatomic,strong)ZYHangYeFBM *Hm;


@end

NS_ASSUME_NONNULL_END
