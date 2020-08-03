//
//  SearchViewController.h
//  FavoriteArtists
//
//  Created by Matthew Martindale on 8/2/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Artist;
@class ArtistController;

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController

@property (nonatomic, nullable) Artist *artist;
@property (nonatomic, nullable) ArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
