//
//  KSIArtistController.h
//  FavoriteArtists-ObjC
//
//  Created by Kevin Stewart on 7/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSIArtist.h"

typedef void(^ArtistFetcherCompletionHandler)(KSIArtist * _Nonnull artist, NSError * _Nonnull error);

NS_ASSUME_NONNULL_BEGIN

@interface KSIArtistController : NSObject

- (void)searchForArtists:(NSString *)name
              completion:( ArtistFetcherCompletionHandler)completionHandler;

@property (nonatomic,readonly) NSArray *artists;
@property (nonatomic, readonly) NSUInteger artistCount;

- (void)addArtist:(KSIArtist *)anArtist;

- (void)savePersistence;
- (void)loadPersistence;


@end

NS_ASSUME_NONNULL_END

