//
//  CBDArtistFetcher.h
//  FavoriteArtist
//
//  Created by Christopher Devito on 5/15/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CBDArtist;

typedef void (^CBDArtistCompletion)(CBDArtist *_Nullable artist, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface CBDArtistFetcher : NSObject

@property (nonatomic, nullable) NSMutableArray *artists;

- (instancetype)initWithArtists:(NSMutableArray *)artists;

- (void)fetchArtistWithName:(NSString *)name
completionBlock:(CBDArtistCompletion)completionBlock;

@end

NS_ASSUME_NONNULL_END
