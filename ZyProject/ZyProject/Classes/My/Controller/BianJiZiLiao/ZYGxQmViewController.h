//
//  ZYGxQmViewController.h
//  ZyProject
//
//  Created by apple on 2020/6/29.
//  Copyright © 2020 123123. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

//申明类，方便写参数
@class ZYGxQmModel,ZYGxQmViewController;
//写协议
@protocol ZYQmDelegate <NSObject>

@optional
//@required 默认必须遵守 @optional可遵守

//协议方法
-(void)GaiGXqmViewController:(ZYGxQmViewController *)VC GxQmModel:(ZYGxQmModel *)gxqmM;


@end

@interface ZYGxQmViewController : BaseViewController

//模型传值
@property(nonatomic,strong)ZYGxQmModel *ContactM;

//遵守协议
@property(nonatomic,weak)id<ZYQmDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
