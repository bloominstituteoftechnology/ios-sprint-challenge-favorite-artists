//
//  MRFNetworking.h
//  PXFavArtist
//
//  Created by Michael Flowers on 7/19/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRFArtist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^MRFArtistFetcherCompletionBlock)(MRFArtist *, NSError *);
@interface MRFNetworking : NSObject

-(void)fetchArtistWithName:(NSString *)artistName
           completionBlock:(MRFArtistFetcherCompletionBlock)completionBlock;
@end

NS_ASSUME_NONNULL_END
