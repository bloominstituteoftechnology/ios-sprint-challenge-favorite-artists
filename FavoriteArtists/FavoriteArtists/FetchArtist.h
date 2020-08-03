//
//  FetchArtist.h
//  FavoriteArtists
//
//  Created by Matthew Martindale on 8/2/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ArtistFetchCompletionHandler)(NSArray *_Nullable artists, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface FetchArtist : NSObject

- (void)fetchArtistWithSearchedName: (NSString *)name
                  completionHandler: (ArtistFetchCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
