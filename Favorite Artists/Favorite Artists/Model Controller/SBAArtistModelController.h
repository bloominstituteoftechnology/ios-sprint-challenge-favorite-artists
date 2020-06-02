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

//create array for savedArtists
@property (nonatomic,readonly) NSArray *savedArtists;


- (void)fetchArtistWithName:(NSString *)artistName
            completionBlock:(void (^)(SBAArtist * _Nullable artist, NSError * _Nullable error))completionBlock;

- (void)parseJSONData:(NSData *)data
      completionBlock:(void (^)(SBAArtist * _Nullable artist, NSError * _Nullable error))completionBlock;

- (void)loadFromPersistence:(void (^)(NSError * _Nullable error))completionBlock;

- (void)saveArtist:(SBAArtist *)artist;

@end

NS_ASSUME_NONNULL_END
