//
//  LSIArtistController.h
//  Favorite_Artistis
//
//  Created by Joe on 8/2/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSIArtist;

typedef void(^ArtistFetcherCompletionHandler)(LSIArtist *newArtist, NSError *error);

@interface LSIArtistController : NSObject

@property (nonatomic, readwrite) LSIArtist *artist;
@property (nonatomic, readonly, copy) NSArray<LSIArtist *> *artists;


- (void)searchForArtists:(NSString *)searchItem completion:(ArtistFetcherCompletionHandler)completion;

- (void)addArtist:(LSIArtist *)anArtist;

- (NSDictionary *)toDictionary:(LSIArtist *)artist;

- (void)fromDictionary:(NSDictionary<NSString *, NSDictionary *> *)artistsFromFile;

@end

