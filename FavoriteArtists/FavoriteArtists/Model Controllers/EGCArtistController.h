//
//  EGCArtistController.h
//  FavoriteArtists
//
//  Created by Enrique Gongora on 4/17/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EGCArtist;

@interface EGCArtistController : NSObject

@property (readonly, nonatomic) NSArray *savedArtists;
@property (readonly, nonatomic) EGCArtist *currentArtist;

- (void)loadFromPersistentStore;
- (void)saveArtist:(EGCArtist *)artist;
- (void)removeArtist:(EGCArtist *)artist;
- (void)searchForArtistWithName:(NSString *)name completion:(void (^)(EGCArtist *artist, NSError *error))completion;

@end
