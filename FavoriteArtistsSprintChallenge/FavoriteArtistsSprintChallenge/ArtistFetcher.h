//
//  ArtistFetcher.h
//  FavoriteArtistsSprintChallenge
//
//  Created by Dillon P on 4/19/20.
//  Copyright © 2020 Dillon's Lambda Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"
#import "Artist+NSJSONSerialization.h"

typedef void(^ArtistFetcherCompletionHandler)(Artist *_Nullable artist, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface ArtistFetcher : NSObject

@property (nonatomic, retain) NSMutableArray<Artist *> *allArtists;
@property (nonatomic, retain) NSDictionary *localArtistDictionary;
@property (readonly, copy) NSArray<Artist *> *allValues;

- (void)fetchArtistFromServer:(NSString *)artistName WithCompletionHandler:(ArtistFetcherCompletionHandler)completionHandler;

- (void)createOrLoadArtistDictionary;
- (NSError *)createLocalArtistDictionary;

- (void)saveNewArtistToLocalDictionary;

- (NSURL *)getLocalArtistsDictionaryURL;
- (void)parseLocalArtistDataWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
