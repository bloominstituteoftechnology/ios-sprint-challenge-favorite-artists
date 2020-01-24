//
//  JBDetailViewController.h
//  Unit4Sprint2Challenge
//
//  Created by Jon Bash on 2020-01-24.
//  Copyright © 2020 Jon Bash. All rights reserved.
//

#import <UIKit/UIKit.h>


@class JBArtistController;
@class JBArtist;


@interface JBDetailViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic) JBArtistController *artistController;
@property (nonatomic) JBArtist *artist;
@property (nonatomic) BOOL willSearch;

@end
