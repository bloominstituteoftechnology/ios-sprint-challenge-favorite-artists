//
//  SearchArtistsViewController.h
//  FavoriteArtistsSprintChallenge
//
//  Created by Dillon P on 4/19/20.
//  Copyright © 2020 Dillon's Lambda Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Artist.h"
#import "ArtistFetcher.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchArtistsViewController : UIViewController <UISearchBarDelegate, UITextFieldDelegate>

@property (nonatomic) Artist *artistDetail;
@property (nonatomic) ArtistFetcher *artistFetcher;

@end

NS_ASSUME_NONNULL_END
