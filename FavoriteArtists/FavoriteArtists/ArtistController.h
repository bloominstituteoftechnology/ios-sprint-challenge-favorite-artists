//
//  ArtistController.h
//  FavoriteArtists
//
//  Created by Bobby Keffury on 2/7/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

typedef void (^ArtistFetcherCompletionHandler)(Artist * _Nullable artist, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface ArtistController : NSObject

//MARK: - Properties

@property (nonatomic, readonly, copy) NSArray<Artist *> *artists;


//MARK: - Methods

- (void)addArtist:(Artist *)anArtist;
- (void)removeArtist:(Artist *)anArtist;

- (void)fetchArtistWithSearchTerm:(NSString *)searchTerm
                completionHandler:(ArtistFetcherCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
