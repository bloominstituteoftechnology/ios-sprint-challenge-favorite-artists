//
//  ArtistResults.h
//  FavoriteArtists
//
//  Created by Matthew Martindale on 8/2/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistResults : NSObject

- (instancetype)initWithArtists: (NSArray<Artist *> *)artists NS_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithDictionary: (NSDictionary *)dictionary;

@property (nonatomic, readonly, copy) NSArray<Artist *> *artists;

@end

NS_ASSUME_NONNULL_END
