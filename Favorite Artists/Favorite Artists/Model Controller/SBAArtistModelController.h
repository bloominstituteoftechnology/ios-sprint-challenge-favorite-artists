//
//  SBAArtistModelController.h
//  Favorite Artists
//
//  Created by Sal B Amer on 5/29/20.
//  Copyright © 2020 Sal B AmerDEv. All rights reserved.
//

#import <Foundation/Foundation.h>
//fwd class declaraion
@class SBAArtist;

NS_ASSUME_NONNULL_BEGIN

@interface SBAArtistModelController : NSObject

@property (nonatomic, readonly) NSMutableArray<SBAArtist *> *favoriteArtists;

- (void)fetchArtistWithName:(NSString *)artistName
            completionBlock:(void (^)(SBAArtist * _Nullable artist, NSError * _Nullable error))completionBlock;

- (void)parseJSONData:(NSData *)data
      completionBlock:(void (^)(SBAArtist * _Nullable artist, NSError * _Nullable error))completionBlock;

//- (void)loadArtistsFromPersistence:(void (^)(NSError * _Nullable error))completionBlock;

@end

NS_ASSUME_NONNULL_END
