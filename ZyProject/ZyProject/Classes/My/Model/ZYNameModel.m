//
//  ZYNameModel.m
//  XiangMu
//
//  Created by apple on 2020/5/25.
//  Copyright © 2020 apple. All rights reserved.
//

#import "ZYNameModel.h"

@implementation ZYNameModel




+ (instancetype)ContactModelWithname:(NSString *)name  {
    
   ZYNameModel *ContactM =  [[ZYNameModel alloc] init];
    ContactM.name = name;
    return ContactM;
    
}



@end
