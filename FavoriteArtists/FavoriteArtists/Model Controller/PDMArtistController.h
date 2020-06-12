//
//  PDMArtistController.h
//  FavoriteArtists
//
//  Created by Patrick Millet on 6/12/20.
//  Copyright © 2020 PatrickMillet79. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PDMArtist;

@interface PDMArtistController : NSObject

- (void)searchForArtistWithName:(NSString *)name completion:(void(^)(PDMArtist *))completion;

- (void)addArtist:(PDMArtist *)artist;

- (void)saveArtists;
- (NSArray *)loadArtists;

@property (nonatomic, copy, readonly) NSArray *artists;

@end

NS_ASSUME_NONNULL_END
