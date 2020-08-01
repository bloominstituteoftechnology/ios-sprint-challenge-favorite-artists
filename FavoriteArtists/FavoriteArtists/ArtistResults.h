//
//  ArtistResults.h
//  FavoriteArtists
//
//  Created by Claudia Maciel on 7/31/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistResults : NSObject

// Properties
@property (nonatomic, readonly, copy) NSArray<Artist *> *artists;

// Initializers
- (instancetype)initWithArtists:(NSArray<Artist *> *)artists NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)initwithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
