//
//  OTKSearchArtistViewController.h
//  FavoriteArtists
//
//  Created by Tobi Kuyoro on 15/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OTKArtist.h"
#import "OTKArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OTKSearchArtistViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic) OTKArtistController *artistController;
@property (nonatomic) OTKArtist *artist;

@end

NS_ASSUME_NONNULL_END
