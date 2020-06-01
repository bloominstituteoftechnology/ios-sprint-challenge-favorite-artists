//
//  DSCFavoriteArtistTableViewController.h
//  FavoriteArtists
//
//  Created by denis cedeno on 5/29/20.
//  Copyright © 2020 DenCedeno Co. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DSCArtistController;
@class DSCFetchArtist;
@class DSCArtist;
NS_ASSUME_NONNULL_BEGIN

@interface DSCFavoriteArtistTableViewController : UITableViewController

@property (nonatomic) DSCArtistController *aController;
@property (nonatomic) DSCArtist *artist;

@end

NS_ASSUME_NONNULL_END
