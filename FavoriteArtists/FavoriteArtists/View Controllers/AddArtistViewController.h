//
//  AddArtistViewController.h
//  FavoriteArtists
//
//  Created by Cody Morley on 7/17/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAMArtistController.h"
#import "CAMArtist+Serialization.h"
#import "CAMArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddArtistViewController : UIViewController <UISearchBarDelegate>

@property CAMArtistController *controller;
@property CAMArtist *artist;

@end

NS_ASSUME_NONNULL_END
