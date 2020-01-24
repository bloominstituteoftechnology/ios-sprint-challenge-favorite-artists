//
//  DMOArtistController.h
//  DMOArtistsWeek14SprintChallenge
//
//  Created by morse on 1/24/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DMOArtist;

@interface DMOArtistController : NSObject

@property (readonly, nonatomic) NSArray *savedArtists;
@property (readonly, nonatomic) DMOArtist *currentArtist;

- (void)loadFromPersistentStore;
- (void)saveArtist:(DMOArtist *)artist;
- (void)removeArtist:(DMOArtist *)artist;
- (void)searchForArtistWithName:(NSString *)name completion:(void (^)(DMOArtist *artist, NSError *error))completion;

@end
