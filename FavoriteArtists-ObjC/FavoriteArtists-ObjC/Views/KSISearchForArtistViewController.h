//
//  KSISearchForArtistViewController.h
//  FavoriteArtists-ObjC
//
//  Created by Kevin Stewart on 7/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSIArtistController.h"
#import "KSIArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSISearchForArtistViewController : UIViewController

@property (nonatomic) KSIArtistController *ksiArtistController;
@property (nonatomic) KSIArtist *ksiArtist;
- (void)updateViews;
- (void)saveArtist;

@end

NS_ASSUME_NONNULL_END
