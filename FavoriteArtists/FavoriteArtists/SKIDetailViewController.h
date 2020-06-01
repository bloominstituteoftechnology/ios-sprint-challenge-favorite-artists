//
//  SKIDetailViewController.h
//  FavoriteArtists
//
//  Created by Joshua Rutkowski on 5/31/20.
//

#import <UIKit/UIKit.h>

@class SKIArtistController;
@class SKIArtist;

@interface SKIDetailViewController : UIViewController <UISearchBarDelegate>

@property SKIArtistController *artistController;
@property SKIArtist *artist;

@end
