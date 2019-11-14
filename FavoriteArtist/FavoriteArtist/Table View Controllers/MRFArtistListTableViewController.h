//
//  MRFArtistListTableViewController.h
//  PXFavArtist
//
//  Created by Michael Flowers on 7/19/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MRFArtistController;

@interface MRFArtistListTableViewController : UITableViewController
@property (nonatomic) MRFArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
