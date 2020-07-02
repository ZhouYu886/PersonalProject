//
//  ZYNiChengViewController.h
//  ZyProject
//
//  Created by apple on 2020/6/18.
//  Copyright © 2020 123123. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

//申明类，方便写参数
@class ZYNameModel,ZYNiChengViewController,ZYMyViewController;
//写协议
@protocol ZyNameVCDelegate <NSObject>

//协议方法
-(void)GainichengViewController:(ZYNiChengViewController *)VC NichengModel:(ZYNameModel *)ContactModel;

@end
@interface ZYNiChengViewController : BaseViewController

//模型传值
@property(nonatomic,strong)ZYNameModel *ContactM;

//遵守协议
@property(nonatomic,weak)id<ZyNameVCDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
