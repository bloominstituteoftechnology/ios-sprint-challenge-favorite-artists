//
//  HHArtistController.h
//  Artist
//
//  Created by Hayden Hastings on 7/19/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHArtist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^HHArtistControllerCompletionBlock)(HHArtist *, NSError *);

@interface HHArtistController : NSObject

- (void)fetchArtist:(NSString *)name
    completionBlock:(HHArtistControllerCompletionBlock)completionBlock;

// add Artist;
- (void)addArtist:(HHArtist *)artist;

- (HHArtist *)fetchSavedArtist:(HHArtist *)artist;
- (NSMutableArray *)fetchAllSavedArtists;

@end

NS_ASSUME_NONNULL_END
