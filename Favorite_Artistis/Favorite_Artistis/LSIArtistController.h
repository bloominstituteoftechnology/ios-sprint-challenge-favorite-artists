//
//  LSIArtistController.h
//  Favorite_Artistis
//
//  Created by Joe on 8/2/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ArtistFetcherCompletionHandler)(LSIArtist *newArtist, NSError *error);

@class LSIArtist;

@interface LSIArtistController : NSObject

@property (nonatomic, readonly, copy) NSArray<LSIArtist *> *artists;

@property (nonatomic) NSUInteger artistCount;

- (void)addArtist:(LSIArtist *)anArtist;

- (LSIArtist *)artistAtIndex:(NSUInteger)index;

@end
