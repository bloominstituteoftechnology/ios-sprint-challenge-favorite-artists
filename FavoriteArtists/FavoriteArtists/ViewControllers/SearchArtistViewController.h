//
//  SearchArtistViewController.h
//  FavoriteArtists
//
//  Created by Bhawnish Kumar on 6/12/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSIArtistController.h"
#import "LSIArtist.h"
NS_ASSUME_NONNULL_BEGIN

@interface SearchArtistViewController : UIViewController

@property (nonatomic, assign) LSIArtistController *artistController;
@property (nonatomic, assign) LSIArtist *artist;
@end

NS_ASSUME_NONNULL_END
