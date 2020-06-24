//
//  ZYSheQuB.h
//  ZyProject
//
//  Created by apple on 2020/6/23.
//  Copyright © 2020 123123. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYSheQuB : NSObject
@property(nonatomic,strong)NSString *head;
@property(nonatomic,strong)NSString *nickName;

+(instancetype)Sb:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
