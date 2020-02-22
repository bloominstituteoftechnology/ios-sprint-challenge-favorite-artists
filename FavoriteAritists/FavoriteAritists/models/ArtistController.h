//
//  ArtistController.h
//  FavoriteAritists
//
//  Created by brian vilchez on 1/24/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"
@class Artist;
NS_ASSUME_NONNULL_BEGIN

@interface ArtistController : NSObject

@property(nonatomic) NSArray * artists;
@property NSURL *baseURL;

- (void)fetchArtistWithName:(NSString *)name completion:(void(^)(NSError *error, Artist *artist))completion;
- (void)createArtistWithName:(NSString *)name yearFormed:(int)yearFormed biography:(NSString *)biography;
- (void)saveToUserDefaults:(Artist *)artist;
- (void)loadFromUserDefaults;
- (void)deleteArtist:(Artist *)artist;
@end

NS_ASSUME_NONNULL_END
