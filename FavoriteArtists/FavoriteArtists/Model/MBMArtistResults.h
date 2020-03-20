//
//  MBMArtistResults.h
//  FavoriteArtists
//
//  Created by Michael on 3/20/20.
//  Copyright © 2020 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MBMArtist;

NS_ASSUME_NONNULL_BEGIN

@interface MBMArtistResults : NSObject

@property (nonatomic, readonly, copy) NSArray<MBMArtist *> *artists;

- (instancetype)initWithArtists:(NSArray<MBMArtist *> *)artists;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
