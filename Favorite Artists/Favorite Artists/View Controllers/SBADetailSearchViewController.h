//
//  SBADetailSearchViewController.h
//  Favorite Artists
//
//  Created by Sal B Amer on 5/29/20.
//  Copyright © 2020 Sal B AmerDEv. All rights reserved.
//

#import <UIKit/UIKit.h>

//forward class decleration
@class SBAArtistModelController;
@class SBAArtist;
NS_ASSUME_NONNULL_BEGIN

@interface SBADetailSearchViewController : UIViewController

@property (nonatomic, nullable) SBAArtist *artist;
@property (nonatomic) SBAArtistModelController *artistController;

@end

NS_ASSUME_NONNULL_END
