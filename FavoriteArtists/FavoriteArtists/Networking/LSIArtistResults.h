//
//  LSIArtistResults.h
//  FavoriteArtists
//
//  Created by Elizabeth Thomas on 9/27/20.
//

#import <Foundation/Foundation.h>

@class LSIArtist;

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtistResults : NSObject

- (instancetype)initWithArtists: (NSArray<LSIArtist *> *)artists NS_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithDictionary: (NSDictionary *)dictionary;

@property (nonatomic, readonly, copy) NSArray<LSIArtist *> *artists;

@end

NS_ASSUME_NONNULL_END
