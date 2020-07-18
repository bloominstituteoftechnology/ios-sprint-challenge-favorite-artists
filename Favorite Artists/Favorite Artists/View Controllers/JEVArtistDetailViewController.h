//
//  JEVArtistDetailViewController.h
//  Favorite Artists
//
//  Created by Joe Veverka on 7/18/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JEVArtist;
@class JEVArtistController;

NS_ASSUME_NONNULL_BEGIN

@interface JEVArtistDetailViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic, strong) JEVArtist *artist;
@property (nonatomic, strong) JEVArtistController *controller;

- (void)updateViews;
- (void)setArtist;

@end

NS_ASSUME_NONNULL_END
