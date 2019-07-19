//
//  MRFAddorShowArtistViewController.h
//  PXFavArtist
//
//  Created by Michael Flowers on 7/19/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//use forward class declaration to improve build time performance
@class MRFArtist;
@class MRFArtistController;

@interface MRFAddorShowArtistViewController : UIViewController <UISearchBarDelegate>

@property MRFArtistController *artistContrller;
@property (nonatomic) MRFArtist *artist;

@end

NS_ASSUME_NONNULL_END
