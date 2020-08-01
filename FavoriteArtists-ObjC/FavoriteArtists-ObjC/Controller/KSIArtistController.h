//
//  KSIArtistController.h
//  FavoriteArtists-ObjC
//
//  Created by Kevin Stewart on 7/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSIArtist.h"

typedef void(^ArtistFetcherCompletionHandler)(KSIArtist * _Nullable artist, NSError * _Nullable error);

@interface KSIArtistController : NSObject

- (void)searchForArtists:(nonnull NSString *)name
              completion:(nonnull ArtistFetcherCompletionHandler)completionHandler;

@property (nonatomic,readonly,copy) NSArray<KSIArtist *> *artists;
@property (nonatomic, readonly) NSUInteger artistCount;

- (KSIArtist *)artistAtIndex:(NSUInteger)index;

- (void)addArtist:(KSIArtist *)anArtist;


@end


