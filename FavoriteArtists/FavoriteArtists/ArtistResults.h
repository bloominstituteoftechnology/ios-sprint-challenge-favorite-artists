//
//  ArtistResults.h
//  FavoriteArtists
//
//  Created by Clayton Watkins on 9/25/20.
//

#import <Foundation/Foundation.h>

@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistResults : NSObject

@property (nonatomic, readonly, copy) NSArray <Artist *> *artists;

- (instancetype)initWithArtists:(NSArray<Artist *> *)artists NS_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
