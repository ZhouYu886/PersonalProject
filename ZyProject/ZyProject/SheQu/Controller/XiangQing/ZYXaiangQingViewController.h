//
//  ZYXaiangQingViewController.h
//  ZyProject
//
//  Created by apple on 2020/6/17.
//  Copyright © 2020 123123. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
@class ZYSheQuM,talkListModel;
@interface ZYXaiangQingViewController : BaseViewController
@property(nonatomic,strong)ZYSheQuM *SheQuM;
//@property (nonatomic,strong) talkListModel *talkM;
@property (nonatomic, copy)void (^didSureBtnBlock)(void);
@property(nonatomic,strong)NSMutableArray *SQarray;
@property(nonatomic,strong)NSMutableArray *XiangQingarray;


@end

NS_ASSUME_NONNULL_END
