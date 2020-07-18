//
//  SABArtistFetcher.h
//  FavoriteArtistsSprint
//
//  Created by Stephanie Ballard on 7/17/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SABArtist;

NS_ASSUME_NONNULL_BEGIN

typedef void (^SABArtistFetcherCompletion)(NSArray <SABArtist *> *artists, NSError *error);

@interface SABArtistFetcher : NSObject

-(void)fetchArtistsByName:(NSString *)strArtist
              completions:(SABArtistFetcherCompletion)completion;

@end

NS_ASSUME_NONNULL_END
