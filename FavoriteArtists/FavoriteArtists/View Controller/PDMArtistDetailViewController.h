//
//  PDMArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Patrick Millet on 6/12/20.
//  Copyright © 2020 PatrickMillet79. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PDMArtist;
@class PDMArtistController;

NS_ASSUME_NONNULL_BEGIN

@interface PDMArtistDetailViewController : UIViewController <UISearchBarDelegate>

- (void)updateViews;

@property (nonatomic, strong) PDMArtist *artist;
@property (nonatomic, strong) PDMArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
