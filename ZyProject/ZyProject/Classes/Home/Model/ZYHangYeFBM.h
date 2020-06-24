//
//  ZYHangYeFBM.h
//  ZyProject
//
//  Created by apple on 2020/6/23.
//  Copyright © 2020 123123. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYHangYeFBM : NSObject

@property(nonatomic,strong)NSString *title;

@property(nonatomic,strong)NSString *content;

@property(nonatomic,strong)NSString *picture;


+(instancetype)HYFBM:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
