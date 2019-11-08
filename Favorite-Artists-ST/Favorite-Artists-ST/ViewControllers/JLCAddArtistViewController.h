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

@interface JLCAddArtistViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic) JLCArtistController *artistController;
@property (nonatomic) JLCArtist *artist;

@end

