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

@property (nonatomic,readonly,copy) NSArray* _Nullable artists;
@property (nonatomic, readonly) NSUInteger artistCount;

- (void)addArtist:(KSIArtist *_Nullable)anArtist;


@end


