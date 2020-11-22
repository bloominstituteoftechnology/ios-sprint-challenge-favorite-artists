//
//  ArtistDetailVC.h
//  FavoriteArtists
//
//  Created by Cora Jacobson on 11/21/20.
//

#import <UIKit/UIKit.h>

@class ArtistController;
@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistDetailVC : UIViewController <UISearchBarDelegate>

@property (nonatomic) Artist *artist;
@property (nonatomic) ArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
