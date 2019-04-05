//
//  GLIArtistDetailController.h
//  FavoriteArtists
//
//  Created by Julian A. Fordyce on 4/5/19.
//  Copyright © 2019 Julian A. Fordyce. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLIArtistDetailController : NSObject

- (void)fetchArtistDetailsWithCompletionBlock:(NSString *)name completion:(void (^) (NSError *error))completionBlock;

@property NSMutableArray *artistDetails;

@end

NS_ASSUME_NONNULL_END
