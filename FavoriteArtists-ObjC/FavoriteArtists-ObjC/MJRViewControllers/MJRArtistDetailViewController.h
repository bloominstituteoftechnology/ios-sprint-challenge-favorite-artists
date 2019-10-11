//
//  MJRArtistDetailViewController.h
//  FavoriteArtists-ObjC
//
//  Created by Marlon Raskin on 10/11/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MJRArtistController;
@class MJRArtist;

@interface MJRArtistDetailViewController : UIViewController <UISearchBarDelegate>

@property MJRArtistController *artistController;
@property MJRArtist *artist;

@end
