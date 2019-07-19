//
//  HHSearchViewController.h
//  Artist
//
//  Created by Hayden Hastings on 7/19/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHSearchViewController : UIViewController <UISearchBarDelegate>

@property HHArtist *artistToSave;

@end

NS_ASSUME_NONNULL_END
