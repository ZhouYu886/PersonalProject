//
//  ViewController+CurrentVC.m
//  GameCommunity
//
//  Created by SSnowCat on 2019/8/27.
//  Copyright © 2019 SSnowCat. All rights reserved.
//

#import "ViewController+CurrentVC.h"



@implementation UIViewController (CurrentVC)
+ (UIViewController *)jsd_getRootViewController{
	
	UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
	NSAssert(window, @"The window is empty");
	return window.rootViewController;
}

+ (UIViewController *)jsd_getCurrentViewController{
	
	UIViewController* currentViewController = [self jsd_getRootViewController];
	BOOL runLoopFind = YES;
	while (runLoopFind) {
		if (currentViewController.presentedViewController) {
			
			currentViewController = currentViewController.presentedViewController;
		} else if ([currentViewController isKindOfClass:[UINavigationController class]]) {
			
			UINavigationController* navigationController = (UINavigationController* )currentViewController;
			currentViewController = [navigationController.childViewControllers lastObject];
			
		} else if ([currentViewController isKindOfClass:[UITabBarController class]]) {
			
			UITabBarController* tabBarController = (UITabBarController* )currentViewController;
			currentViewController = tabBarController.selectedViewController;
		} else {
			
			NSUInteger childViewControllerCount = currentViewController.childViewControllers.count;
			if (childViewControllerCount > 0) {
				
				currentViewController = currentViewController.childViewControllers.lastObject;
				
				return currentViewController;
			} else {
				
				return currentViewController;
			}
		}
		
	}
	return currentViewController;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
