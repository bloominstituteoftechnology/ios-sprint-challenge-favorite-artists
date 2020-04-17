//
//  EPWAddSearchViewController.h
//  Favorite-Artists Sprint
//
//  Created by Elizabeth Wingate on 4/17/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPWArtist.h"
#import "EPWArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SearchDetailDelegate <NSObject>

-(void)didSave:(EPWArtist *)artist;

@end

@interface EPWAddSearchViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

NS_ASSUME_NONNULL_END
