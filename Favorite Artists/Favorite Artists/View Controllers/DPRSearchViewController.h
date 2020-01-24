//
//  DPRSearchViewController.h
//  Favorite Artists
//
//  Created by Dennis Rudolph on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPRArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DPRSearchViewController : UIViewController <UISearchBarDelegate>

@property DPRArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
