//
//  BYArtistViewController.h
//  Artist-objc
//
//  Created by Bradley Yin on 10/11/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class BYArtistController;
@class BYArtist;

@interface BYArtistViewController : UIViewController

@property BYArtistController *controller;
@property BYArtist *artist;

@end

NS_ASSUME_NONNULL_END
