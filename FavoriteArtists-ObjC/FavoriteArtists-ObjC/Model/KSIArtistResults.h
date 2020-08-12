//
//  KSIArtistResults.h
//  FavoriteArtists-ObjC
//
//  Created by Kevin Stewart on 7/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSIArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSIArtistResults : NSObject

- (instancetype)initWithArtists:(NSArray<KSIArtist *> *)artists NS_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, readonly, copy) NSArray<KSIArtist *> *artists;

@end

NS_ASSUME_NONNULL_END
