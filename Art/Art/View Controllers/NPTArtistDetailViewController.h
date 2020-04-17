//
//  ArtistDetailViewController.h
//  Art
//
//  Created by Nick Nguyen on 4/17/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class NPTArtistController;
@class NPTArtist;

@interface NPTArtistDetailViewController : UIViewController<UISearchBarDelegate,UISearchDisplayDelegate>


@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property NPTArtistController *artistController;
@property NPTArtist *artist;


@end

NS_ASSUME_NONNULL_END
