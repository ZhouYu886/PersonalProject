//
//  ZYKxM.h
//  ZyProject
//
//  Created by apple on 2020/6/23.
//  Copyright © 2020 123123. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYKxM : NSObject

@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *time;
+(instancetype)KuaiXM:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
