//
//  NSObject+Artist_NSJSONSerialization.h
//  FavoriteAritists
//
//  Created by brian vilchez on 1/25/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>
#import "Artist.h"
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Artist_NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary; 

- (NSDictionary *)toDictionary;
@end

NS_ASSUME_NONNULL_END
