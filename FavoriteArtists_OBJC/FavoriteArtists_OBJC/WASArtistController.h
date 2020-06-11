//
//  WASArtistController.h
//  FavoriteArtists_OBJC
//
//  Created by Alex Shillingford on 6/11/20.
//  Copyright © 2020 shillwil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WASArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface WASArtistController : NSObject

@property (readonly, nonatomic) NSArray *savedArtists;
@property (readonly, nonatomic) WASArtist *currentArtist;

- (void)loadFromPersistentStore;
- (void)saveArtist:(WASArtist *)artist;
- (void)removeArtist:(WASArtist *)artist;
- (void)searchForArtistWithName:(NSString *)name completion:(void (^)(WASArtist *artist, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
