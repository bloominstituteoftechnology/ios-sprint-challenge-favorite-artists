//
//  ArtistResults.h
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 6/11/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistResults : NSObject

- (instancetype)initWithArtists:(NSArray<Artist *> *)artists;
- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, readonly, copy) NSArray<Artist *> *artists;

@end

NS_ASSUME_NONNULL_END
