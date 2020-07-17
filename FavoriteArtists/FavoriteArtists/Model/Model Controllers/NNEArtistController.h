//
//  NNEArtistController.h
//  FavoriteArtists
//
//  Created by Nonye on 7/17/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NNEArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface NNEArtistController : NSObject

typedef void(^ArtistFetchCompletion)(NNEArtist * _Nullable artist, NSError * _Nullable error);

@property (nonatomic, copy) NSArray<NNEArtist *> *artists;

- (void)findArtist:(NSString *)artistName completion:(ArtistFetchCompletion)completion;
- (void)saveArtist:(NNEArtist *)artist;

@end


NS_ASSUME_NONNULL_END
