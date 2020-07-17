//
//  EJSFavoriteArtistController.h
//  FavoriteArtist
//
//  Created by Enzo Jimenez-Soto on 7/17/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EJSFavoriteArtist;

NS_ASSUME_NONNULL_BEGIN

@interface EJSFavoriteArtistController : NSObject

@property (nonatomic, readonly) NSArray *favoriteArtists;

- (void)fetchFavoriteArtistByName:(NSString *)artist completion:(void(^)(EJSFavoriteArtist *, NSError *error))completion;

- (void)addArtistWithArtist:(NSString *)artist
                       year:(int)year
                        bio:(NSString *)bio;

- (NSURL *)applicationDocumentsDirectory;

@end

NS_ASSUME_NONNULL_END
