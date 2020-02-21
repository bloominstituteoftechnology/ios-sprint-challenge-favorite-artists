//
//  CARArtistFetcher.h
//  FavoriteArtists
//
//  Created by Chad Rutherford on 2/21/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CARFavoriteArtist.h"

typedef void(^CARArtistFetcherCompletion) (CARFavoriteArtist * _Nullable artist, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface CARArtistFetcher : NSObject

- (void)fetchArtistForSearchString:(NSString *)searchString
                        completion:(CARArtistFetcherCompletion)completion;

@end

NS_ASSUME_NONNULL_END
