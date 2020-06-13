//
//  MJPAristController.h
//  Artists
//
//  Created by Mark Poggi on 6/12/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPArtist.h"
#import "MJPArtist+NSJSONSerialization.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^MJPCompletionBlock)(MJPArtist *_Nullable artist, NSError *_Nullable error);

@interface MJPArtistController : NSObject

@property NSMutableArray *artists;
@property NSMutableArray *fetchedArtists;

- (void)loadfromPersistentStore;
- (void)createArtist:(MJPArtist *)artist;
- (void)deleteArtist:(MJPArtist *)artist;
- (void)fetchArtist:(NSString *)name completionBlock:(MJPCompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
