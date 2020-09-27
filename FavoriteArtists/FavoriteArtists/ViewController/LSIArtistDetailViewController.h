//
//  LSIArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Elizabeth Thomas on 9/27/20.
//

#import <UIKit/UIKit.h>

@class LSIArtist;
@class LSIArtistController;

@interface LSIArtistDetailViewController : UIViewController

@property (nonatomic, nullable) LSIArtist *artist;
@property (nonatomic, nullable) LSIArtistController *artistController;
@property (nonatomic) BOOL isShowingArtistDetail;

@end

