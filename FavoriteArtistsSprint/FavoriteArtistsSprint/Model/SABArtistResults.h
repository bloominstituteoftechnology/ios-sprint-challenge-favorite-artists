//
//  SABArtistResults.h
//  FavoriteArtistsSprint
//
//  Created by Stephanie Ballard on 7/17/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SABArtist;

NS_ASSUME_NONNULL_BEGIN

@interface SABArtistResults : NSObject

@property (nonatomic, readonly, copy) NSArray<SABArtist *> *artists;

- (instancetype)initWithArtists:(NSArray<SABArtist *> *)artists;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
