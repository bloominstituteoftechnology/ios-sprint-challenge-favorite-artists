//
//  DSCAddArtistViewController.h
//  FavoriteArtists
//
//  Created by denis cedeno on 5/29/20.
//  Copyright © 2020 DenCedeno Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSCArtist;
@class DSCArtistController;

NS_ASSUME_NONNULL_BEGIN

@interface DSCAddArtistViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic) DSCArtist *artist;
@property (nonatomic) DSCArtistController *aController;

@end

NS_ASSUME_NONNULL_END
