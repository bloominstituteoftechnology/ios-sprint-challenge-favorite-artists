//
//  MKJAddArtistViewController.h
//  FavoriteArtists
//
//  Created by Kenneth Jones on 12/3/20.
//

#import <UIKit/UIKit.h>
#import "MKJArtistFetcher.h"

NS_ASSUME_NONNULL_BEGIN

@interface MKJAddArtistViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic) MKJArtistFetcher *fetcher;

@end

NS_ASSUME_NONNULL_END
