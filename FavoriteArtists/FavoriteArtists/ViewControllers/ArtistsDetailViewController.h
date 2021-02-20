//
//  ArtistsDetailViewController.h
//  FavoriteArtists
//
//  Created by John McCants on 2/18/21.
//

#import <UIKit/UIKit.h>

@class Artist;
@class ArtistModelController;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistsDetailViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic) Artist *artist;
@property (nonatomic) ArtistModelController *artistModelController;



@end

NS_ASSUME_NONNULL_END
