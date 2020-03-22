//
//  MBMArtistSearchViewController.h
//  FavoriteArtists
//
//  Created by Michael on 3/20/20.
//  Copyright © 2020 Michael. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ArtistFetcher;
@class MBMArtist;

@interface MBMArtistSearchViewController : UIViewController

@property (nonatomic, strong) ArtistFetcher *artistFetcher;

@property (nonatomic, strong) MBMArtist *artist;
@end

NS_ASSUME_NONNULL_END
