//
//  SongDetailViewController.h
//  LyricFinder
//
//  Created by Benjamin Hakes on 3/1/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BHSearchNetworkController.h"
#import "BHSong.h"
#import "BHSongController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BHSongDetailViewController : UIViewController

@property BHSearchNetworkController *searchController;
@property BHSongController *songController;
@property BHSong *song;
@property BOOL isUpdatingView;

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;
@property (weak, nonatomic) IBOutlet UITextField *songNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistNameTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricTextView;



- (IBAction)stepperTapped:(id)sender;
- (IBAction)searchButtonTapped:(id)sender;
- (IBAction)saveButtonTapped:(id)sender;



@end

NS_ASSUME_NONNULL_END
