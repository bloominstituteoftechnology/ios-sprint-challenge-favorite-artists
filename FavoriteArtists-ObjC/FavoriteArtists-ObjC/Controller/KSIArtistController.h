//
//  KSIArtistController.h
//  FavoriteArtists-ObjC
//
//  Created by Kevin Stewart on 7/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ArtistFetcherCompletionHandler)(NSArray * _Nullable artist, NSError * _Nullable error);

@interface KSIArtistController : NSObject

- (void)searchForArtists:(nonnull NSString *)name
              completion:(nonnull ArtistFetcherCompletionHandler)completionHandler;

@end


