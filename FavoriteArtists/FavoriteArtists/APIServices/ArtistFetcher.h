//
//  ArtistFetcher.h
//  FavoriteArtists
//
//  Created by Michael on 3/20/20.
//  Copyright © 2020 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBMArtist.h"
#import "MBMArtist+NSJSONSerialization.h"

typedef void (^MBMArtistFetcherCompletion) (NSArray<MBMArtist *> * _Nullable artists, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface ArtistFetcher : NSObject

@property (nonatomic)NSURL *filePath;

@property (nonatomic) NSMutableArray *artistsArray;

- (NSURL *)artistFilePath;

- (void)saveToPersistentStore;

- (void)loadFromPersistentStore;

- (void)searchArtistsWithArtistName:(NSString *)artistName
                    completionBlock:(MBMArtistFetcherCompletion)completion;

@end

NS_ASSUME_NONNULL_END
