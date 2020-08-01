//
//  ViewController.h
//  FavoriteArtists
//
//  Created by Claudia Maciel on 7/31/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Artist;
@class ArtistsController;

@interface ArtistDetailViewController : UIViewController

@property (nonatomic, nullable) Artist *artist;
@property (nonatomic, nullable) ArtistsController *artistController;
@property (nonatomic) BOOL isShowingArtistDetail;

@end

