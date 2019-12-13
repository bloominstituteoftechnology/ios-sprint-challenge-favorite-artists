//
//  LSIArtistController.h
//  Favorite Artists
//
//  Created by Isaac Lyons on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSIArtist;

@interface LSIArtistController : NSObject

@property NSArray *artists;

- (void)getArtistsFromSearchTerm:(NSString *)searchTerm
                      completion:(void (^)(NSError *error, LSIArtist *artist))completion;

@end
