//
//  Artist.h
//  FavoriteArtists
//
//  Created by Shawn Gee on 5/15/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtist : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *biography;
@property (nonatomic, readonly, nullable) NSNumber *yearFormed;

@end

NS_ASSUME_NONNULL_END
