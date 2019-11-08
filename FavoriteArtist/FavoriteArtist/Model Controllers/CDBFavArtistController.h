//
//  CDBFavArtistController.h
//  FavoriteArtist
//
//  Created by Ciara Beitel on 11/8/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDBFavArtistController : NSObject

@property (nonatomic) NSArray *favArtists;

- (void)searchForFavArtists:(NSString *)searchTerm completion:(void (^)(NSArray *favArtists, NSError *error))completion;

@end
