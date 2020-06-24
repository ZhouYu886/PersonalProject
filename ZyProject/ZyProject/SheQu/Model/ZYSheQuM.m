//
//  ZYSheQuM.m
//  ZyProject
//
//  Created by apple on 2020/6/23.
//  Copyright © 2020 123123. All rights reserved.
//

#import "ZYSheQuM.h"
#import "ZYSheQuB.h"

@implementation ZYSheQuM
+(instancetype)SheQu:(NSDictionary *)dict
{
    ZYSheQuM *SheQuM = [ZYSheQuM new];
    SheQuM.picture = dict[@"picture"];
    SheQuM.content = dict[@"content"];
    SheQuM.talkId = dict[@"id"];
    if ([dict.allKeys containsObject:@"user"]) {
        if ([(NSDictionary *)dict[@"user"]allKeys].count > 0) {
            ZYSheQuB *user = [ZYSheQuB Sb:dict[@"user"]];
            SheQuM.user = user;
        }
    }
    return SheQuM;
}
@end
