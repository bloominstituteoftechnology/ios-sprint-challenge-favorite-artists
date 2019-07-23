//
//  LSIArtistController.h
//  FaveArtists
//
//  Created by John Pitts on 7/19/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSIArtist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^LSIArtistFetcherCompletionBlock)(LSIArtist *, NSError *);

@interface LSIArtistController : NSObject

@property (nonatomic) NSArray *bands;     //not sure why i'd need to specify nonatomic here
//@property LSIArtist *fetchedArtist;

- (void)fetchArtistWith:(NSString *)searchTerm
        completionBlock:(LSIArtistFetcherCompletionBlock)completionBlock;

- (void)addArtist:(LSIArtist *)artist;

- (NSUInteger)countOfArtists;

@end

NS_ASSUME_NONNULL_END
