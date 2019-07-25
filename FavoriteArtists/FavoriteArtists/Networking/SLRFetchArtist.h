//
//  SLRFetchArtist.h
//  FavoriteArtists
//
//  Created by Sameera Roussi on 7/19/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLRArtist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^SLRCompletionBlock) (SLRArtist *, NSError *);

@interface SLRFetchArtist : NSObject

- (void)fetchArtistsByName:(NSString*)name completionBlock:(SLRCompletionBlock)completionBlock;

- (NSMutableArray *)artistArray;


@end

NS_ASSUME_NONNULL_END
