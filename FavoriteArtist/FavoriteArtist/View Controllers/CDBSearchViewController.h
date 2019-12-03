//
//  CDBSearchViewController.h
//  FavoriteArtist
//
//  Created by Ciara Beitel on 11/8/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDBFavArtistController.h"
#import "CDBFavArtist.h"

@interface CDBSearchViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic) CDBFavArtistController *favArtistController;
@property (nonatomic) CDBFavArtist *favArtist;

@end

