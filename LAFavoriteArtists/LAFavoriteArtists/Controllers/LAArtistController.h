//
//  LAArtistController.h
//  LAFavoriteArtists
//
//  Created by Angel Buenrostro on 4/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LAArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface LAArtistController : NSObject

// add Artist
-(void)addArtist:(LAArtist *)artist;

// fetch Artist from file
-(LAArtist *)fetchSavedArtist:(LAArtist *)artist;

-(NSMutableArray *)fetchAllSavedArtists;

@end

NS_ASSUME_NONNULL_END
