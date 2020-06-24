//
//  ZYQDCGViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/19.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYQDCGViewController.h"

@interface ZYQDCGViewController ()

@end

@implementation ZYQDCGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
            self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
}

- (IBAction)pop:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
