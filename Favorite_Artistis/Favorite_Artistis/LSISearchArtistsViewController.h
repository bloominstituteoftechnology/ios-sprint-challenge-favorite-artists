//
//  LSISearchArtistsViewController.h
//  Favorite_Artistis
//
//  Created by Joe on 5/30/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSIArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSISearchArtistsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UISearchBar *artistSearchBar;
@property (weak, nonatomic) IBOutlet UILabel *dateFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *artistBioLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *artistSaveButton;

@property (nonatomic) LSIArtistController *lsiPersonController;


@end

NS_ASSUME_NONNULL_END
