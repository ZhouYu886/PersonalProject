//
//  ZYBJXbViewController.m
//  ZyProject
//
//  Created by apple on 2020/6/18.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYBJXbViewController.h"

@interface ZYBJXbViewController ()
@property (weak, nonatomic) IBOutlet UIButton *ManBtn;

@property (weak, nonatomic) IBOutlet UIButton *WomanBtn;

@end

@implementation ZYBJXbViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
          self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
}

- (IBAction)POP:(UIButton *)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)ManBtn:(UIButton *)sender
{
    self.WomanBtn.selected = sender.selected;
    sender.selected = !sender.selected;
}


- (IBAction)WomanBtn:(UIButton *)sender
{
    self.ManBtn.selected = sender.selected;
      sender.selected = !sender.selected;
    
}

@end
