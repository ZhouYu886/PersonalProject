//
//  AppDelegate.m
//  ZyProject
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 123123. All rights reserved.
//

#import "AppDelegate.h"
#import "ZYNavigationController.h"
#import "ZyTabBarController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    ZyTabBarController *vc = [ZyTabBarController new];

    
    [self.window setRootViewController:vc];
    [self.window makeKeyAndVisible];
    
    return YES;
}





@end
