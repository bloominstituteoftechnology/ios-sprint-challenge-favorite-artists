//
//  LSINetworkingClient.h
//  FavoriteArtists
//
//  Created by Shawn Gee on 5/15/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSIArtist;

typedef void (^LSIArtistQueryCompletion)(NSArray<LSIArtist *> * _Nullable artists, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface LSIAudioDBClient : NSObject

- (void)fetchArtistsForQuery:(NSString *)query
                  completion:(LSIArtistQueryCompletion)completion;

@end

NS_ASSUME_NONNULL_END
