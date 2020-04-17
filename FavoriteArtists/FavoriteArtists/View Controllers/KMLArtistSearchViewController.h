//
//  KMLArtistSearchViewController.h
//  FavoriteArtists
//
//  Created by Keri Levesque on 4/17/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class KMLArtistController;
@class KMLArtist;

@interface KMLArtistSearchViewController : UIViewController  <UISearchBarDelegate>


@property (nonatomic) KMLArtistController *artistController;
@property (nonatomic) KMLArtist *artist;

@end

NS_ASSUME_NONNULL_END
