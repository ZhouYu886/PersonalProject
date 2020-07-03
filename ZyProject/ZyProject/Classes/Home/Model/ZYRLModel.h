//
//  ZYRLModel.h
//  ZyProject
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 123123. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYRLModel : NSObject
@property (nonatomic,strong) NSString *consensus;
@property (nonatomic,strong) NSString *country;
@property (nonatomic,strong) NSString *id;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *previous;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,assign) NSInteger star;
@property (nonatomic,strong) NSString *affect;

@end

NS_ASSUME_NONNULL_END
