//
//  HAOArtistFetcher.h
//  FavoriteArtists
//
//  Created by Hunter Oppel on 6/12/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HAOArtist;

typedef void (^HAOArtistFetcherCompletion)(HAOArtist * _Nullable artist, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface HAOArtistFetcher : NSObject

- (void)fetchArtistWithName:(NSString *)name completion:(HAOArtistFetcherCompletion)completion;

@end

NS_ASSUME_NONNULL_END
