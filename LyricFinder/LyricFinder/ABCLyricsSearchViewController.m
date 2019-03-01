//
//  ABCLyricsDetailViewController.m
//  LyricFinder
//
//  Created by Austin Cole on 3/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import "ABCLyricsSearchViewController.h"
#import "LyricsController.h"
#import "Song+NSJSONSerialization.h"

@interface ABCLyricsSearchViewController ()

@property NSFileManager *fileManager;
@property LyricsController *lyricsController;
@property(nonatomic) NSString *results;


@end

@implementation ABCLyricsSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lyricsController = [[LyricsController alloc] init];
    _fileManager = NSFileManager.defaultManager;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

- (IBAction)saveButtonTapped:(id)sender {
    if (_lyricsTextView.text != nil) {
        [_songController saveSongwithTrack: _trackTextField.text withArtist:_artistTextField.text withLyrics:_lyricsTextView.text withRating: [_ratingLabel.text integerValue] ];
        
    }
}

- (IBAction)searchForLyricsButtonTapped:(id)sender {
    if (_artistTextField.text != nil && _trackTextField.text != nil) {
        NSString *artist = [[NSString alloc]initWithString:_artistTextField.text];
        NSString *track = [[NSString alloc] initWithString: _trackTextField.text];
        NSBlockOperation *fetchOperation = [[NSBlockOperation alloc] init];
        NSBlockOperation *updateOperation = [[NSBlockOperation alloc] init];
        [updateOperation addExecutionBlock:^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateViews];
            });
        }];
        [fetchOperation addExecutionBlock:^{
            [self->_lyricsController fetchLyricsWithArtist:artist withTrack: track withCompletionHandler:^(NSError * _Nonnull error) {
            }];
        }];
        NSOperationQueue *opQueue = [[NSOperationQueue alloc] init];
        [opQueue addOperation:fetchOperation];
        [opQueue addOperation:updateOperation];

        
    }
}

- (IBAction)ratingButtonTapped:(id)sender {
    NSInteger oldValue = [_ratingLabel.text integerValue];
    NSInteger newvalue = 0;
    if ([sender tag] == 0) {
        newvalue = oldValue - 1;
    } else {
        newvalue = oldValue + 1;
    }
    _ratingLabel.text = [NSString stringWithFormat:@"%lu", newvalue];
}

- (void)updateViews {
    _lyricsTextView.text = _lyricsController.results;
}

- (void)setResults:(NSString *)results {
    [self updateViews];
}
@end
