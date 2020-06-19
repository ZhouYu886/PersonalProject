//
//  ViewController+CurrentVC.h
//  GameCommunity
//
//  Created by SSnowCat on 2019/8/27.
//  Copyright © 2019 SSnowCat. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (CurrentVC)
+ (UIViewController *)jsd_getRootViewController;
+ (UIViewController *)jsd_getCurrentViewController;


@end

NS_ASSUME_NONNULL_END
