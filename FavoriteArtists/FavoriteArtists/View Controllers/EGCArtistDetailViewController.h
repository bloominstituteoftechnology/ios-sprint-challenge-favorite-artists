//
//  EGCArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Enrique Gongora on 4/17/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EGCArtistController;
@class EGCArtist;

@interface EGCArtistDetailViewController : UIViewController <UISearchBarDelegate>

@property EGCArtistController *artistController;
@property EGCArtist *artist;

@end
