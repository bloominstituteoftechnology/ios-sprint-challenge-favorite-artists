//
//  FavoriteArtistsTableViewController.h
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 5/29/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Artist.h"

NS_ASSUME_NONNULL_BEGIN

@class ArtistController;

@interface FavoriteArtistsTableViewController : UITableViewController

@property ArtistController *artistController;


//- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)atomically API_DEPRECATED_WITH_REPLACEMENT("writeToURL:error:", macos(10.0, API_TO_BE_DEPRECATED), ios(2.0, API_TO_BE_DEPRECATED), watchos(2.0, API_TO_BE_DEPRECATED), tvos(9.0, API_TO_BE_DEPRECATED)); // the atomically flag is ignored if url of a type that cannot be written atomically.
//


@end

NS_ASSUME_NONNULL_END
