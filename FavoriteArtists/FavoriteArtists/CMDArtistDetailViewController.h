//
//  CMDArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Chris Dobek on 6/12/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CMDArtistController;
@class CMDArtist;

@interface CMDArtistDetailViewController : UIViewController<UISearchBarDelegate>

@property CMDArtistController *artistController;
@property CMDArtist *artist;

@end

NS_ASSUME_NONNULL_END
