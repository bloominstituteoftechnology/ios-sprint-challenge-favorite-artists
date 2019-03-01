//
//  ABCLyricsDetailViewController.m
//  LyricFinder
//
//  Created by Austin Cole on 3/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "ABCLyricsSearchViewController.h"
#import "LyricsController.h"
#import "ABCSongController.h"

@interface ABCLyricsSearchViewController ()

@property LyricsController *lyricsController;
@property ABCSongController *songController;
@property(nonatomic) NSString *results;

@end

@implementation ABCLyricsSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lyricsController = [[LyricsController alloc] init];
    _songController = [[ABCSongController alloc] init];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

- (IBAction)saveButtonTapped:(id)sender {
}

- (IBAction)ratingIncrememnterSegmentedControlTapped:(id)sender {
}

- (IBAction)searchForLyricsButtonTapped:(id)sender {
    if (_artistTextField.text != nil && _trackTextField.text != nil) {
        NSBlockOperation *fetchOperation = [[NSBlockOperation alloc] init];
        NSBlockOperation *updateOperation = [[NSBlockOperation alloc] init];
        [updateOperation addExecutionBlock:^{
            [self updateViews];
        }];
        [fetchOperation addExecutionBlock:^{
            [self->_lyricsController fetchLyricsWithArtist:_artistTextField.text withTrack:_trackTextField.text withCompletionHandler:^(NSError * _Nonnull error) {
            }];
        }];
        [fetchOperation start];
        [updateOperation start];

        
    }
}

- (void)updateViews {
    _lyricsTextView.text = _lyricsController.results;
}

- (void)setResults:(NSString *)results {
    [self updateViews];
}
@end
