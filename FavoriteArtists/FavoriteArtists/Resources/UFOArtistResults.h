//
//  UFOArtistResults.h
//  FavoriteArtists
//
//  Created by Ufuk Türközü on 17.04.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UFOArtist;

NS_ASSUME_NONNULL_BEGIN

@interface UFOArtistResults : NSObject

@property (nonatomic, readonly, copy) NSMutableArray<UFOArtist *> *artists;

- (instancetype)initWithArtists:(NSMutableArray<UFOArtist *> *)artists;
- (instancetype)initWithDictionary:(NSMutableDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
