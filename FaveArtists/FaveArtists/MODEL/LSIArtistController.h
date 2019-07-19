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


@interface LSIArtistController : NSObject

@property /* (nonatomic) */ NSArray *bands;     //not sure why i'd need to specify nonatomic here

- (void)fetchArtistWith:(NSString *)searchTerm;

- (void)addArtist:(LSIArtist *)artist;

- (NSUInteger)countOfArtists;

@end

NS_ASSUME_NONNULL_END
