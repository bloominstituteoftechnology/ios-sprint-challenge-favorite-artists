//
//  JSKArtistResults.h
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import <Foundation/Foundation.h>

@class JSKArtist;

NS_ASSUME_NONNULL_BEGIN

@interface JSKArtistResults : NSObject

- (instancetype)initWithArtists:(NSArray<JSKArtist *> *)artists NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, readonly, copy) NSArray<JSKArtist *> *artists;

@end

NS_ASSUME_NONNULL_END
