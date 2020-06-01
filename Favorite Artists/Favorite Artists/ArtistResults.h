//
//  ArtistResults.h
//  Favorite Artists
//
//  Created by David Wright on 6/1/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistResults : NSObject

- (instancetype)initWithArtists:(NSArray<Artist *> *)artists NS_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, readonly, copy) NSArray<Artist *> *artists;

@end

NS_ASSUME_NONNULL_END
