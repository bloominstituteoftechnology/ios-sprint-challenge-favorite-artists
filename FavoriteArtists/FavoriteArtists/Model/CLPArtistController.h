//
//  CLPArtistController.h
//  FavoriteArtists
//
//  Created by Chad Parker on 7/31/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLPArtist;

NS_ASSUME_NONNULL_BEGIN

@interface CLPArtistController : NSObject

- (void)addArtist:(CLPArtist *)artist;

- (NSUInteger)artistCount;
- (CLPArtist *)artistAtIndex:(int)index;

@end

NS_ASSUME_NONNULL_END
