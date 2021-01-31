//
//  ArtistTableView.h
//  FavArtist
//
//  Created by Norlan Tibanear on 1/27/21.
//

#import <UIKit/UIKit.h>

@class Artist;
@class ArtistController;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistTableView : UITableViewController

@property (nonatomic) Artist *artist;
@property (nonatomic) ArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
