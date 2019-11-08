//
//  JLCAddArtistViewController.h
//  Favorite-Artists-ST
//
//  Created by Jake Connerly on 11/8/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLCArtistController.h"
#import "JLCArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface JLCAddArtistViewController : UIViewController

@property (nonatomic) JLCArtistController *artistController;
@property (nonatomic) JLCArtist *artist;

@end

NS_ASSUME_NONNULL_END
