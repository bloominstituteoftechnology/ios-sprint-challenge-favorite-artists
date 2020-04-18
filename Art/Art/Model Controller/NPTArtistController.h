//
//  ViewController.h
//  Art
//
//  Created by Nick Nguyen on 4/17/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NPTArtist;

@interface NPTArtistController : NSObject

@property (readonly, nonatomic) NSArray *savedArtists;
@property (readonly, nonatomic) NPTArtist *currentArtist;

- (void)loadFromPersistentStore;
- (void)saveArtist:(NPTArtist *)artist;
- (void)removeArtist:(NPTArtist *)artist;
- (void)searchForArtistWithName:(NSString *)name completion:(void (^)(NPTArtist *artist, NSError *error))completion;

@end
