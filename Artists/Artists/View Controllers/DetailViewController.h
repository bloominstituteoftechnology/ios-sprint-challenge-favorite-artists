//
//  DetailViewController.h
//  Artists
//
//  Created by Alexander Supe on 20.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic) Artist *artist;

@end

NS_ASSUME_NONNULL_END
