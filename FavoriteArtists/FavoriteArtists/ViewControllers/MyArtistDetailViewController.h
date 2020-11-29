//
//  MyArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Gladymir Philippe on 11/22/20.
//

#import <UIKit/UIKit.h>
#import "MyArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyArtistDetailViewController : UIViewController

@property (nonatomic, assign) MyArtistController *artistController;

@property (nonatomic, assign) MyArtist *artist;

@end

NS_ASSUME_NONNULL_END
