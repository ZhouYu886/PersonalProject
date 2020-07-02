//
//  userModel.m
//  firstProject
//
//  Created by apple on 2020/5/25.
//  Copyright © 2020 ap. All rights reserved.
//

#import "userModel.h"
#import "talkListModel.h"
#import "ZYFenSiModel.h"

@implementation userModel

+(instancetype)fensi:(NSDictionary *)dict
{
    userModel *um = [userModel new];
     if ([dict.allKeys containsObject:@"list"]) {
         if ([(NSDictionary *)dict[@"list"]allKeys].count > 0) {
             ZYFenSiModel *usmM = [ZYFenSiModel fensiWitnDict:dict];
             um.list = usmM;
         }
     }
     return um;
}
@end
