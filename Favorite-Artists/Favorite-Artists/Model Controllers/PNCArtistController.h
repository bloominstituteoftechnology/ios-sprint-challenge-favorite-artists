//
//  PNCArtistController.h
//  Favorite-Artists
//
//  Created by Percy Ngan on 1/24/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PNCArtist;

@interface PNCArtistController : NSObject

@property NSMutableArray *artists;

typedef void(^PNCArtistCompletion)(PNCArtist *, NSError *);

- (void)addArtist:(PNCArtist *)artist;
- (void)loadArtists;
- (void)saveArtists;

- (void)fetchArtistWithKeyword:(NSString *)keyword completitionBlock:(PNCArtistCompletion)completionBlock;

@end


