//
//  SKIArtistController.h
//  FavoriteArtists
//
//  Created by Joshua Rutkowski on 5/31/20.
//

#import <Foundation/Foundation.h>

@class SKIArtist;

@interface SKIArtistController : NSObject

@property (readonly, nonatomic) NSArray *savedArtists;
@property (readonly, nonatomic) SKIArtist *currentArtist;

- (void)loadFromPersistentStore;
- (void)saveArtist:(SKIArtist *)artist;
- (void)removeArtist:(SKIArtist *)artist;
- (void)searchForArtistWithName:(NSString *)name completion:(void (^)(SKIArtist *artist, NSError *error))completion;

@end

