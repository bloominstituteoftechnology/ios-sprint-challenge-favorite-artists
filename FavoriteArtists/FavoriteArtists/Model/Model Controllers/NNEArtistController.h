//
//  NNEArtistController.h
//  FavoriteArtists
//
//  Created by Nonye on 7/17/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NNEArtist;

NS_ASSUME_NONNULL_BEGIN

@interface NNEArtistController : NSObject

@property (nonatomic, readonly) NSArray *myArtists;

- (void)fetchArtistByName:(NSString *)artist completion:(void(^)(NNEArtist *, NSError *error))completion;

- (void)addArtistWithArtist:(NSString *)artist
                       year:(int)year
                        bio:(NSString *)bio;

- (NSURL *)applicationDocumentsDirectory;


@end


NS_ASSUME_NONNULL_END
