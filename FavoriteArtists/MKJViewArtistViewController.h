//
//  MKJViewArtistViewController.h
//  FavoriteArtists
//
//  Created by Kenneth Jones on 12/3/20.
//

#import <UIKit/UIKit.h>
#import "MKJArtistFetcher.h"

NS_ASSUME_NONNULL_BEGIN

@interface MKJViewArtistViewController : UIViewController

@property (nonatomic) MKJArtistFetcher *fetcher;
@property (nonatomic) MKJArtist *artist;

@end

NS_ASSUME_NONNULL_END
