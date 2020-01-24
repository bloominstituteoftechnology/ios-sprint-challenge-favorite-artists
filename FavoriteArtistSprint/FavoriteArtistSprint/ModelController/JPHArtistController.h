//
//  JPHArtistController.h
//  FavoriteArtistSprint
//
//  Created by Jerry haaser on 1/24/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JPHArtist;

@interface JPHArtistController : NSObject

- (void)searchArtistWithName:(NSString *)artistName completion:(void(^)(JPHArtist *artist, NSError *error))completion;

- (NSMutableArray *)favoriteArtists;

@end

