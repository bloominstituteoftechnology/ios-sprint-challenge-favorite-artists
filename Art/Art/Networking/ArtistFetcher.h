//
//  ArtistFetcher.h
//  Art
//
//  Created by Nick Nguyen on 4/17/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NPTArtist;
typedef void (^NPTArtistFetcherCompletionBlock)(NPTArtist * _Nullable artist,NSError * _Nullable error);
NS_ASSUME_NONNULL_BEGIN

@interface ArtistFetcher : NSObject
@property NSMutableArray<NPTArtist *> *favoriteArtists;

- (instancetype)initWithArtist:(NSMutableArray<NPTArtist *> *)artists;

- (void)fetchArtistWithSearchTerm:(NSString *)term completionBlock:(NPTArtistFetcherCompletionBlock)completionBlock;
@end

NS_ASSUME_NONNULL_END
