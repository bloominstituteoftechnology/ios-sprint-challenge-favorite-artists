//
//  LSISearchArtistViewController.h
//  Favorite Artists
//
//  Created by macbook on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSIArtist;
@class LSIArtistController;

NS_ASSUME_NONNULL_BEGIN

@interface LSISearchArtistViewController : UIViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong) LSIArtist *artist;
@property (nonatomic, strong) LSIArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
