//
//  LSIArtistFetcher.m
//  Favorite_Artistis
//
//  Created by Joe on 8/3/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import "LSIArtistFetcher.h"

static NSString *const ArtistFetcherBaseURLString = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=";

@implementation LSIArtistFetcher

- (void)fetchArtistdWithCompletionHandler:(nonnull ArtistFetcherCompletionHandler)completionHandler;
- (void)fetchArtistsInTimeInterval:(nonnull NSDateInterval *)interval completionHandler:(nonnull ArtistFetcherCompletionHandler)completionHandler;


@end
