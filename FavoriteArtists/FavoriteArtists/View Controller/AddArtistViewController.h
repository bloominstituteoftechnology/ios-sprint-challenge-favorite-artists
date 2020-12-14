//
//  AddArtistViewController.h
//  FavoriteArtists
//
//  Created by Craig Belinfante on 11/22/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ArtistFetcher;
@class FavoriteArtist;

@interface AddArtistViewController : UIViewController<UISearchBarDelegate>

@property (nonatomic, strong) ArtistFetcher *artistsFetcher;
@property (nonatomic, strong) FavoriteArtist *artist;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistYear;
@property (weak, nonatomic) IBOutlet UITextView *artistBio;

@end

NS_ASSUME_NONNULL_END
