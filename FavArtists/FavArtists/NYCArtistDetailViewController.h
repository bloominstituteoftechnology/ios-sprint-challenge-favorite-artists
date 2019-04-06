//
//  NYCArtistDetailViewController.h
//  FavArtists
//
//  Created by Nathanael Youngren on 4/5/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NYCArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface NYCArtistDetailViewController : UIViewController<UISearchBarDelegate>

- (void)updateViews;

@property (nonatomic) NYCArtist *artist;

@property (atomic) NSMutableArray *_Nullable artists;

@end

NS_ASSUME_NONNULL_END
