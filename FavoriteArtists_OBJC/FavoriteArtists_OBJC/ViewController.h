//
//  ViewController.h
//  FavoriteArtists_OBJC
//
//  Created by Alex Shillingford on 2/21/20.
//  Copyright © 2020 shillwil. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WASArtist;
@class WASArtistController;

@interface ViewController : UIViewController <UISearchBarDelegate>

@property WASArtist *artist;
@property WASArtistController *artistController;

@end

