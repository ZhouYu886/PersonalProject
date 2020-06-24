//
//  ZYKxM.m
//  ZyProject
//
//  Created by apple on 2020/6/23.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYKxM.h"

@implementation ZYKxM

+(instancetype)KuaiXM:(NSDictionary *)dict
{
    ZYKxM *kxM = [ZYKxM new];
    kxM.time = dict[@"time"];
    kxM.content = dict[@"content"];
    return kxM;
    
}

@end
