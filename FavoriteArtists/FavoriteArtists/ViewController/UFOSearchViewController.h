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

@interface UFOSearchViewController : UIViewController

@property (nonatomic, strong) UFOAPIController *apiController;
@property (nonatomic, strong) UFOArtist *artist;

@end

