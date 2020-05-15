//
//  LYDArtistDetailViewController.h
//  LYDFavoriateArtist
//
//  Created by Lydia Zhang on 5/15/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LYDArtistController;
@class LYDArtist;

@interface LYDArtistDetailViewController : UIViewController<UISearchBarDelegate>

@property LYDArtistController *artistController;
@property LYDArtist *artist;

@end

NS_ASSUME_NONNULL_END
