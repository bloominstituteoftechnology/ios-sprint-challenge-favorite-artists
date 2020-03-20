//
//  AMCArtistController.h
//  FavArtist
//
//  Created by Aaron Cleveland on 3/20/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AMCArtist;

typedef void (^CompletionHandler)(AMCArtist *artist, NSError *error);

@interface AMCArtistController : NSObject

// Add array property
@property (nonatomic, readonly, copy) NSArray<AMCArtist *> *artists;

// Add methods
- (void)fetchArtist:(NSString *)artist completionHandler:(CompletionHandler)completionHandler;
- (void)loadArtist;
- (void)addArtist:(AMCArtist *)aArtist;
- (void)removeArtist:(AMCArtist *)aArtist;

@end
