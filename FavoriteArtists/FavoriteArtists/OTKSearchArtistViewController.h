//
//  OTKSearchArtistViewController.h
//  FavoriteArtists
//
//  Created by Tobi Kuyoro on 15/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OTKArtist.h"
#import "OTKArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OTKSearchArtistViewController : UIViewController

typedef NS_ENUM(NSInteger, DetailView) {
    FindArtist,
    ShowArtist
};

@property (nonatomic) OTKArtistController *artistController;
@property (nonatomic) OTKArtist *artist;
@property (nonatomic) DetailView detailView;

@end

NS_ASSUME_NONNULL_END
