//
//  VVSArtistController.h
//  Favorite Artists
//
//  Created by Vici Shaweddy on 2/9/20.
//  Copyright © 2020 Vici Shaweddy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVSArtist+NSJSONSerialization.h"

@class  VVSArtist;

@interface VVSArtistController : NSObject

- (void)searchForArtist:(NSString *)searchTerm completion:(void (^)(VVSArtist *artist, NSError *error))completion;

- (NSArray *)fetchFavoritedArtists;

@end

