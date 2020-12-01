//
//  ArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Bohdan Tkachenko on 11/30/20.
//

#import <UIKit/UIKit.h>

@class ArtistController;
@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistDetailViewController : UIViewController

@property (nonatomic) Artist *artist;
@property (nonatomic) ArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
