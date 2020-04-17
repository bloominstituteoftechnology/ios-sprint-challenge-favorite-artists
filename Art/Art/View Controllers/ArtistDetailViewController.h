//
//  ArtistDetailViewController.h
//  Art
//
//  Created by Nick Nguyen on 4/17/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArtistDetailViewController : UIViewController<UISearchBarDelegate,UISearchDisplayDelegate>


@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;



@end

NS_ASSUME_NONNULL_END
