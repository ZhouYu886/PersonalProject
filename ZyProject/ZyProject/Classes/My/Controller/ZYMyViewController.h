//
//  ZYMyViewController.h
//  ZyProject
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 123123. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@class ListModel,ZYNameModel;
@interface ZYMyViewController : BaseViewController
@property(nonatomic,strong)ListModel *list;
@property(nonatomic,strong)ZYNameModel *NameM;

@property (nonatomic, copy)void (^didSureBtnBlock)(void);
@end

NS_ASSUME_NONNULL_END
