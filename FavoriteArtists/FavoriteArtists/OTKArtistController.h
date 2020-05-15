//
//  OTKArtistController.h
//  FavoriteArtists
//
//  Created by Tobi Kuyoro on 15/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OTKArtist.h"

typedef void(^ArtistFetchCompletion)(OTKArtist * _Nullable artist, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface OTKArtistController : NSObject

@property (nonatomic) NSMutableArray *artists;

- (instancetype)initWithArray:(NSMutableArray *)artists;
- (void)findArtist:(NSString *)artistName completion:(ArtistFetchCompletion)completion;
- (void)saveArtist:(OTKArtist *)artist;

@end

NS_ASSUME_NONNULL_END
