//
//  FavoriteArtistTableViewController.h
//  FavoriteArtists
//
//  Created by Craig Belinfante on 11/22/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ArtistFetcher;
@class FavoriteArtist;

@interface FavoriteArtistTableViewController : UITableViewController

@property ArtistFetcher *artistsFetcher;

@end

NS_ASSUME_NONNULL_END
