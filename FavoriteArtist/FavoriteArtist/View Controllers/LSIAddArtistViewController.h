//
//  LSIAddArtistViewController.h
//  FavoriteArtist
//
//  Created by Lambda_School_Loaner_214 on 11/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSIArtist.h"
#import "LSIArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSIAddArtistViewController : UIViewController <UISearchBarDelegate>
@property (nonatomic) LSIArtist *artist;
@property (nonatomic) LSIArtistController *artistController;
@end

NS_ASSUME_NONNULL_END
