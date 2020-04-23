//
//  FavoriteArtistsViewController.h
//  FavoriteArtistsSprintChallenge
//
//  Created by Dillon P on 4/19/20.
//  Copyright © 2020 Dillon's Lambda Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Artist.h"
#import "ArtistFetcher.h"

NS_ASSUME_NONNULL_BEGIN

@interface FavoriteArtistsViewController : UIViewController

@property (nonatomic) ArtistFetcher *artistFetcher;
@property (nonatomic) NSMutableArray *artistsArray;


@end

NS_ASSUME_NONNULL_END
