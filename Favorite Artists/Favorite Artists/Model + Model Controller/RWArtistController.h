//
//  RWArtistController.h
//  Favorite Artists
//
//  Created by Rick Wolter on 2/21/20.
//  Copyright © 2020 Devshop7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWArtist.h"
NS_ASSUME_NONNULL_BEGIN

@interface RWArtistController : NSObject


@property NSMutableArray *artists;

- (void)searchArtistByName:(NSString *)name completion:(void (^)(RWArtist *artist, NSError *error))completion;
- (void)saveArtists;
- (void)loadArtists;


@end

NS_ASSUME_NONNULL_END
