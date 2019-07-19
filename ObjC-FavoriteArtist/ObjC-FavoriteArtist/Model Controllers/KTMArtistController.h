//
//  KTMArtistController.h
//  ObjC-FavoriteArtist
//
//  Created by Kobe McKee on 7/19/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTMArtist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^KTMArtistSearchCompletionBlock)(KTMArtist *, NSError *);

@interface KTMArtistController : NSObject

- (void)saveArtist:(KTMArtist *)artist;

- (KTMArtist *)fetchSavedArtist:(KTMArtist *)artist;

- (NSMutableArray *)fetchAllSavedArtists;

- (void)searchForArtist:(NSString *)name
        completionBlock:(KTMArtistSearchCompletionBlock)completionBlock;



@end

NS_ASSUME_NONNULL_END
