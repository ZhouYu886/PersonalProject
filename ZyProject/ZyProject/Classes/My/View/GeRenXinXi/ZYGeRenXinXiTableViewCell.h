//
//  ZYGeRenXinXiTableViewCell.h
//  ZyProject
//
//  Created by apple on 2020/6/18.
//  Copyright © 2020 123123. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class userModel,talkListModel,ListModel;
@interface ZYGeRenXinXiTableViewCell : UITableViewCell
@property(nonatomic,strong)userModel *Um;
//@property(nonatomic,strong)talkListModel *talkM;
@property(nonatomic,strong)ListModel *listM;

@end

NS_ASSUME_NONNULL_END
