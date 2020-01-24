//
//  LSIArtistController.h
//  Favorite Artists
//
//  Created by macbook on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//


#import <Foundation/Foundation.h>

@class LSIArtist;

@interface LSIArtistController : NSObject

- (LSIArtist *)createArtistWithName:(NSString *)name
                          biography:(NSString *)biography
                         yearFormed:(int)yearFormed;

- (void)updateArtist:(LSIArtist *)artist withName:(NSString *)name
           biography:(NSString *)biography
          yearFormed:(int)yearFormed;

- (void)deleteDocument:(LSIArtist *)artist;

@property (nonatomic, copy, readonly) NSArray *favoriteArtists;

@end
