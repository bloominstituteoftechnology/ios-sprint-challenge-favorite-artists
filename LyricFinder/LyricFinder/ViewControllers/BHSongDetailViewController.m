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
    
    NSString *newRatingString = [NSString stringWithFormat:@"Rating: %f", [_song rating]];
    _ratingLabel.text = newRatingString;
    
}

- (IBAction)stepperTapped:(id)sender {
    
    UIStepper *stepper = (UIStepper*)sender;
    double newRatingValue = [stepper value];
    NSString *newRatingValueStr = [NSString stringWithFormat:@"Stepper value is: %f", _ratingStepper.value];
    NSLog(newRatingValueStr);
    
    _song.rating = newRatingValue;
    
    [_song setRating:newRatingValue];
    
    
    NSString *songValue = [NSString stringWithFormat:@"Song value is: %f", _song.rating];
    NSLog(songValue);
    [self updateRating];
}

- (IBAction)searchButtonTapped:(id)sender {
}

- (IBAction)saveButtonTapped:(id)sender {
}
@end
