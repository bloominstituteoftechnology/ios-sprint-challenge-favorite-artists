//
//  LSIArtistResults.h
//  FavoriteArtists
//
//  Created by Shawn Gee on 5/15/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSIArtist;

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtistResults : NSObject

@property (nonatomic, readonly, copy) NSArray<LSIArtist *> *artists;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
