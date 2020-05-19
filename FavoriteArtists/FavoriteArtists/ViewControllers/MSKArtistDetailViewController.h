//
//  ArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_268 on 5/18/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSKArtist.h"
#import "MSKArtistController.h"
NS_ASSUME_NONNULL_BEGIN
@interface MSKArtistDetailViewController : UIViewController <UISearchBarDelegate>
@property (nonatomic)  MSKArtist *artist;
@property (nonatomic)  MSKArtistController *controller;
@end
NS_ASSUME_NONNULL_END
