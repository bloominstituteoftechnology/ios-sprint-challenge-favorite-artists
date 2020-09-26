//
//  SearchDetailViewController.h
//  FavoriteArtists
//
//  Created by Clayton Watkins on 9/25/20.
//

#import <UIKit/UIKit.h>

@class Artist;
@class ArtistPersistenceController;

NS_ASSUME_NONNULL_BEGIN

@interface SearchDetailViewController : UIViewController

@property (nonatomic, nullable) Artist *artist;
@property (nonatomic, nullable) ArtistPersistenceController *persistenceController;
@property (nonatomic) BOOL isShowingFavoriteArtistDetail;

@end

NS_ASSUME_NONNULL_END
