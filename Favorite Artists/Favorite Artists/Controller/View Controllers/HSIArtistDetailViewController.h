//
//  HSIArtistDetailViewController.h
//  Favorite Artists
//
//  Created by Kenny on 6/12/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HSIArtist;
@class HSIArtistController;

NS_ASSUME_NONNULL_BEGIN

@interface HSIArtistDetailViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic, strong) HSIArtist *artist;
@property (nonatomic, strong) HSIArtistController *controller;

- (void)updateViews;
- (void)setupArtist;

@end

NS_ASSUME_NONNULL_END
