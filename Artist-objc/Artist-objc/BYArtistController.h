//
//  BYArtistController.h
//  Artist-objc
//
//  Created by Bradley Yin on 10/11/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BYArtist;

@interface BYArtistController : NSObject

@property NSMutableArray *artists;

typedef void(^BYArtistCompletion)(BYArtist *, NSError *);

- (void)addArtist:(BYArtist *)artist;
- (void)loadArtists;
- (void)saveArtists;

- (void)fetchArtistWithKeyword:(NSString *)keyword completitionBlock:(BYArtistCompletion)completionBlock;

@end

