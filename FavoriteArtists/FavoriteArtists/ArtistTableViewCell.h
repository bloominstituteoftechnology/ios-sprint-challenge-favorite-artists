//
//  ArtistTableViewCell.h
//  FavoriteArtists
//
//  Created by Joel Groomer on 2/8/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Artist;
@class ArtistController;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistTableViewCell : UITableViewCell

@property (nonatomic) Artist *artist;
@property (nonatomic) ArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
