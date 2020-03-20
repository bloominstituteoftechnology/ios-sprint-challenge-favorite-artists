//
//  AMCArtistDetailViewController.h
//  FavArtist
//
//  Created by Aaron Cleveland on 3/20/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AMCArtistController;
@class AMCArtist;

@interface AMCArtistDetailViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic) AMCArtistController *artistController;
@property (nonatomic) AMCArtist *artist;

@end
