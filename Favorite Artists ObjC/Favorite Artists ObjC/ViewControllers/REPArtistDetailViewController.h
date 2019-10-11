//
//  ViewController.h
//  Favorite Artists ObjC
//
//  Created by Michael Redig on 10/11/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class REPArtist;

@interface REPArtistDetailViewController : UIViewController <UISearchBarDelegate>

@property REPArtist* artist;

@end

