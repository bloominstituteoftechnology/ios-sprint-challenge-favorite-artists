//
//  MJSArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Morgan Smith on 9/27/20.
//

#import <UIKit/UIKit.h>
#import "MJSArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MJSArtistDetailViewController : UIViewController
@property (nonatomic, assign) MJSArtistController *artistController;

@property (nonatomic, assign) MJSArtist *artist;


@end

NS_ASSUME_NONNULL_END
