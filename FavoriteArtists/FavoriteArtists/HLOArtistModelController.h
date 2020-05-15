//
//  HLOArtistModelController.h
//  FavoriteArtists
//
//  Created by Karen Rodriguez on 5/15/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HLOArtist;
NS_ASSUME_NONNULL_BEGIN

@interface HLOArtistModelController : NSObject

@property (nonatomic, readonly) NSMutableArray<HLOArtist *> *favoriteArtists;

- (void)fetchArtistWithName:(NSString *)artistName
            completionBlock:(void (^)(NSError * _Nullable error))completionBlock;

- (void)parseJSONData:(NSData *)data
      completionBlock:(void (^)(NSError * _Nullable error))completionBlock;

@end

NS_ASSUME_NONNULL_END
