//
//  ArtistFetcher.h
//  Favorite Artists
//
//  Created by Michael Stoffer on 11/9/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

typedef void (^ArtistFetcherCompletionHandler)(Artist *artist, NSError *error);

@interface ArtistFetcher : NSObject

@property (nonatomic, readonly, copy) NSArray<Artist *> *artists;

- (void)loadArtists;
- (void)addArtist:(Artist *)aArtist;
- (void)removeArtist:(Artist *)aArtist;
- (void)fetchArtist:(NSString *)artist completionHandler:(ArtistFetcherCompletionHandler)completionHandler;


@end
