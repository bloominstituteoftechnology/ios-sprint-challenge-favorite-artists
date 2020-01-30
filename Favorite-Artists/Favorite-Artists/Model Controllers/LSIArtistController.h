//
//  LSIArtistController.h
//  Favorite-Artists
//
//  Created by Percy Ngan on 1/24/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PNCArtist;

@interface LSIArtistController : NSObject

@property NSMutableArray *artists;

- (void)getArtistsFromSearchTerm:(NSString *)searchTerm
					  completion:(void (^)(NSError *error, PNCArtist *artist))completion;

- (void)saveToDocuments;
- (void)loadFromDocuments;

@end


