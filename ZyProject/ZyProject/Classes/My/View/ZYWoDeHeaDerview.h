//
//  ZYWoDeHeaDerview.h
//  ZyProject
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 123123. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ListModel,userModel,ZYNameModel,ZYGxQmModel;
@interface ZYWoDeHeaDerview : UIView
@property (weak, nonatomic) IBOutlet UILabel *DT;
@property (weak, nonatomic) IBOutlet UILabel *FS;
@property (weak, nonatomic) IBOutlet UILabel *GZ;
@property(nonatomic,strong)ListModel *listM;
@property(nonatomic,strong)userModel *usM;
@property(nonatomic,strong)ZYNameModel *ContactM;
@property (weak, nonatomic) IBOutlet UIImageView *TxImage;
@property(nonatomic,strong)ZYGxQmModel *ContM;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *GxQmLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imagePush;
@end

NS_ASSUME_NONNULL_END
