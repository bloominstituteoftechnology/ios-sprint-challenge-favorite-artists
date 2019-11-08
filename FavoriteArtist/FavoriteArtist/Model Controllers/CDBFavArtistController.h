//
//  CDBFavArtistController.h
//  FavoriteArtist
//
//  Created by Ciara Beitel on 11/8/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDBFavArtist.h"

@interface CDBFavArtistController : NSObject

@property (nonatomic) NSArray *favArtists;

- (void)searchForFavArtist:(NSString *)searchTerm completion:(void (^)(CDBFavArtist *favArtist, NSError *error))completion;

- (void)saveFavArtist:(CDBFavArtist *)favArtist;

@end
