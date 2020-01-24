//
//  CCCArtistSearchViewController.h
//  ios-sprint-challenge-favorite-artists
//
//  Created by Jonalynn Masters on 1/24/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCCArtistSearchViewController : UIViewController
@property CCCArtistController *artistController;
@property CCCArtist *searchedArtist;
@end

NS_ASSUME_NONNULL_END
