//
//  Artist.h
//  Favorite Artists
//
//  Created by Vincent Hoang on 7/17/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Artist : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, nullable, copy) NSString *bio;
@property (nonatomic, readonly, nullable, assign) int formed;

@end

NS_ASSUME_NONNULL_END
