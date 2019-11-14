//
//  ArtistDetailViewController.h
//  Favorite Artists
//
//  Created by Michael Stoffer on 11/9/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ArtistFetcher;
@class Artist;

@interface ArtistDetailViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic) ArtistFetcher *artistFetcher;
@property (nonatomic) Artist *artist;

@end
