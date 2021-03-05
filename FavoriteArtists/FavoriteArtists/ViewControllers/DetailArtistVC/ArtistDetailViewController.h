//
//  ArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by James McDougall on 3/4/21.
//

#import <UIKit/UIKit.h>
#import "LSIArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArtistDetailViewController : UIViewController

@property (nonatomic) LSIArtistController *artistController;
@property (nonatomic) LSIArtist *artist;
@property (nonatomic) BOOL isDetailView;

@end

NS_ASSUME_NONNULL_END
