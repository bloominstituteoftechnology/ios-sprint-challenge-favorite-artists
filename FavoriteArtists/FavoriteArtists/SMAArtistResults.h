//
//  SMAArtistResults.h
//  FavoriteArtists
//
//  Created by Sean Acres on 8/2/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SMAFavoriteArtist;

NS_ASSUME_NONNULL_BEGIN

@interface SMAArtistResults : NSObject

- (instancetype)initWithArtists:(NSArray<SMAFavoriteArtist *> *)artists NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, readonly, copy) NSArray<SMAFavoriteArtist *> *artists;

@end

NS_ASSUME_NONNULL_END
