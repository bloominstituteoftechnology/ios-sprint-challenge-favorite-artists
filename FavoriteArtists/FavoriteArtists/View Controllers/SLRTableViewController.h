//
//  SLRTableViewController.h
//  FavoriteArtists
//
//  Created by Sameera Roussi on 7/19/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SLRFetchArtist;
@class SLRArtist;

@interface SLRTableViewController : UITableViewController

@property (nonatomic) SLRFetchArtist *fetchartist;
@property SLRArtist *artist;

@end

NS_ASSUME_NONNULL_END
