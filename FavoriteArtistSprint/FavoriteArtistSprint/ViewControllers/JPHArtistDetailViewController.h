//
//  JPHArtistDetailViewController.h
//  FavoriteArtistSprint
//
//  Created by Jerry haaser on 1/24/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JPHArtistController;
@class JPHArtist;

@interface JPHArtistDetailViewController : UIViewController <UISearchBarDelegate>

@property JPHArtistController *artistController;
@property JPHArtist *artist;

@end


