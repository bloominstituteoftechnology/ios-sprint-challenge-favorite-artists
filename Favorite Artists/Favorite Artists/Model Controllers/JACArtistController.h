//
//  JACArtistController.h
//  Favorite Artists
//
//  Created by Jordan Christensen on 11/9/19.
//  Copyright © 2019 Mazjap Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JACArtist;
@interface JACArtistController : NSObject
@property NSMutableArray *favoriteArtists;

- (void)addFavoriteArtist:(JACArtist *)artist;

- (void)deleteFavoriteArtist:(long)index;

- (void)fetchArtistByName:(NSString *)name
               completion:(void (^)(JACArtist *artist, NSError *error))completion;
@end
