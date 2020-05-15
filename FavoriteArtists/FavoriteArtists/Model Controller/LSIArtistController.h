//
//  LSIArtistController.h
//  FavoriteArtists
//
//  Created by Shawn Gee on 5/15/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSIArtist;

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtistController : NSObject

@property (nonatomic, readonly, copy) NSArray *artists;

- (void)addArtist:(LSIArtist *)artist;

@end

NS_ASSUME_NONNULL_END
