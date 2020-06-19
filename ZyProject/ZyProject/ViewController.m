//
//  ViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated{
        self.navigationController.navigationBar.hidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
     self.navigationController.navigationBar.hidden = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
}


@end
