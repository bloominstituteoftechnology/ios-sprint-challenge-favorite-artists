//
//  DSCFetchArtist.h
//  FavoriteArtists
//
//  Created by denis cedeno on 5/29/20.
//  Copyright © 2020 DenCedeno Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DSCArtist;
typedef void(^ArtistFetcherCompletionHandler) (DSCArtist * _Nullable artist, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface DSCFetchArtist : NSObject

- (void)fetchArtist:(NSString *)name completion:(nonnull ArtistFetcherCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
