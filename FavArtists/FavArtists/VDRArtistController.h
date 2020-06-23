//
//  VDRArtistController.h
//  FavArtists
//
//  Created by Victor  on 7/19/19.
//  Copyright © 2019 Victor . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDRArtist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^VDRArtistSearchCompletionBlock)(VDRArtist *, NSError *);

@interface VDRArtistController : NSObject

- (void)saveArtist:(VDRArtist *)artist;

- (VDRArtist *)fetchSavedArtist:(VDRArtist *)artist;

- (NSMutableArray *)fetchAllSavedArtists;

- (void)searchForArtist:(NSString *)name
        completionBlock:(VDRArtistSearchCompletionBlock)completionBlock;



@end

NS_ASSUME_NONNULL_END
