//
//  DBEArtistFetcher.h
//  FavoriteArtists
//
//  Created by Dahna on 7/17/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBEArtist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^DBEArtistFetchCompletion)(DBEArtist *, NSError *);

@interface DBEArtistFetcher : NSObject

- (void)fetchArtist:(NSString *)name
         completion:(DBEArtistFetchCompletion)completion;

@end

NS_ASSUME_NONNULL_END
