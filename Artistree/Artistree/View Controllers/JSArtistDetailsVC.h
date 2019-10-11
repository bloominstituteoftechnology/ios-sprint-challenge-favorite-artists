//
//  JSArtistDetailsVC.h
//  Artistree
//
//  Created by Jeffrey Santana on 10/11/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSArtistsController;
@class JSArtist;

NS_ASSUME_NONNULL_BEGIN

@interface JSArtistDetailsVC : UIViewController <UISearchBarDelegate>

@property JSArtistsController *artistController;
@property JSArtist *artist;

- (void)updateViews;

@end

NS_ASSUME_NONNULL_END
