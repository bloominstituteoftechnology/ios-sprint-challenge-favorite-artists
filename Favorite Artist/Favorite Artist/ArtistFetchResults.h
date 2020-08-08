//
//  ArtistFetchResults.h
//  Favorite Artist
//
//  Created by Gerardo Hernandez on 8/8/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistFetchResults : NSObject

- (instancetype)initWithArtists:(NSArray<Artist *> *)artists NS_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, readonly, copy) NSArray<Artist *> *artists;

@end

NS_ASSUME_NONNULL_END
