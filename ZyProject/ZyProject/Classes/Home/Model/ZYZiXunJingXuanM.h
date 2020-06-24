//
//  ZYZiXunJingXuanM.h
//  ZyProject
//
//  Created by apple on 2020/6/22.
//  Copyright © 2020 123123. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYZiXunJingXuanM : NSObject

@property(nonatomic,strong)NSString *picture;
@property(nonatomic,strong)NSString *content;

@property (nonatomic, strong) NSMutableArray *list;


+(instancetype)ZiXunMode:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
