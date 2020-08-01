//
//  ArtistsController.h
//  FavoriteArtists
//
//  Created by Claudia Maciel on 7/31/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;
@class ArtistsController;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistsController : NSObject

@property (nonatomic, nullable) Artist *artist;
@property (nonatomic, nullable) ArtistsController *artistController;
@property (nonatomic) BOOL isShowingArtistDetail;

@end

NS_ASSUME_NONNULL_END
