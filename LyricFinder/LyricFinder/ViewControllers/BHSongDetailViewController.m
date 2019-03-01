//
//  SongDetailViewController.m
//  LyricFinder
//
//  Created by Benjamin Hakes on 3/1/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHSongDetailViewController.h"
#import "BHSearchNetworkController.h"
#import "BHSong.h"

@interface BHSongDetailViewController ()


@end

@implementation BHSongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _searchController = [[BHSearchNetworkController alloc] init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _searchController = [[BHSearchNetworkController alloc] init];
    }
    return self;
}

- (void) updateRating{
    
    NSString *newRatingString = [NSString stringWithFormat:@"Rating: %.0f", [_song rating]];
    _ratingLabel.text = newRatingString;
    
}

- (IBAction)stepperTapped:(id)sender {
    
    UIStepper *stepper = (UIStepper*)sender;
    double newRatingValue = [stepper value];
    
    if (newRatingValue > 5) {
        newRatingValue = 5;
    } else if (newRatingValue < 0) {
        newRatingValue = 0;
    }
    
    [_song setRating:newRatingValue];

    [self updateRating];
}

- (IBAction)searchButtonTapped:(id)sender {
}

- (IBAction)saveButtonTapped:(id)sender {
}
@end
