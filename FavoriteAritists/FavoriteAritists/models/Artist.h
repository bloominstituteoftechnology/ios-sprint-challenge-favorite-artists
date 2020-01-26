//
//  Artist.h
//  FavoriteAritists
//
//  Created by brian vilchez on 1/24/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Artist : NSObject

@property NSString *artistName;
@property NSString *biography;
@property int yearFormed;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithArtistName:(NSString *)artistName yearFormed:(int)yearFormed biography:(NSString *)biorgraphy ;
@end

NS_ASSUME_NONNULL_END
