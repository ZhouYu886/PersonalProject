//
//  AppDelegate.h
//  ZyProject
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 123123. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZYNavigationController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow * window;

//@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property(nonatomic,strong)ZYNavigationController *rootVC;

- (void)saveContext;

@end

