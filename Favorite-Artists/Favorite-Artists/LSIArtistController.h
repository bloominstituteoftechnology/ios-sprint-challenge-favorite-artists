//
//  LSIArtistController.h
//  Favorite-Artists
//
//  Created by Percy Ngan on 1/24/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSIArtist;

@interface LSIArtistController : NSObject

@property NSArray *artists;

- (void)getArtistsFromSearchTerm:(NSString *)searchTerm
					  completion:(void (^)(NSError *error, LSIArtist *artist))completion;

@end


