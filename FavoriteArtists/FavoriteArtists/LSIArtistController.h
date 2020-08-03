//
//  LSIArtistController.h
//  FavoriteArtists
//
//  Created by Kelson Hartle on 8/2/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSIArtist;

typedef void (^LSIArtistFetcherCompletion)(LSIArtist * _Nullable artist, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtistController : NSObject

- (void)fetchArtistsWithArtistName:(NSString *)artistName
completionBlock:(LSIArtistFetcherCompletion)completionBlock;



@end

NS_ASSUME_NONNULL_END
