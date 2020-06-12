//
//  LSIArtistController.h
//  FavoriteArtists
//
//  Created by Bhawnish Kumar on 6/12/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSIArtist;

typedef void (^CompletionHandler)(LSIArtist * _Nullable artist, NSError * _Nullable error);
NS_ASSUME_NONNULL_BEGIN

@interface LSIArtistController : NSObject

- (void)fetchArtistName:(NSString *)name completionHandler:(CompletionHandler)completionHandler;

- (void)fetchSavedArtist;

@end

NS_ASSUME_NONNULL_END
