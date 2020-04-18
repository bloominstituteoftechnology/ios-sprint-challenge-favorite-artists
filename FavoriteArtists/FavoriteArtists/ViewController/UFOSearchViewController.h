//
//  ViewController.h
//  FavoriteArtists
//
//  Created by Ufuk Türközü on 17.04.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UFOArtist;
@class UFOAPIController;

NS_ASSUME_NONNULL_BEGIN

@interface UFOSearchViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic, strong) UFOAPIController *apiController;
@property (nonatomic, strong) UFOArtist *artist;

@end

NS_ASSUME_NONNULL_END

