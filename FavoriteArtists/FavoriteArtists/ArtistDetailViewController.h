//
//  ArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Karen Rodriguez on 5/15/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HLOArtistModelController;
@class HLOArtist;
NS_ASSUME_NONNULL_BEGIN

@interface ArtistDetailViewController : UIViewController
@property (nonatomic, nullable) HLOArtist *artist;
@property (nonatomic) HLOArtistModelController *artistController;
@end

NS_ASSUME_NONNULL_END
