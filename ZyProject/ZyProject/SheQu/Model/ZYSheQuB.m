//
//  ZYSheQuB.m
//  ZyProject
//
//  Created by apple on 2020/6/23.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYSheQuB.h"

@implementation ZYSheQuB
+(instancetype)Sb:(NSDictionary *)dict
{
    ZYSheQuB *Sb = [ZYSheQuB new];
    Sb.head = dict[@"head"];
    Sb.nickName = dict[@"nickName"];
    return Sb;
}


@end
