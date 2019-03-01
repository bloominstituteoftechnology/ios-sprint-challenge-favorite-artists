//
//  LMSSongDetailViewController.m
//  Lyric Finder
//
//  Created by Lisa Sampson on 3/1/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import "LMSSongDetailViewController.h"

@interface LMSSongDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;
@property (weak, nonatomic) IBOutlet UITextField *trackNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation LMSSongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews {
    if (self.song) {
        
        self.title = self.song.trackName;
        
        self.artistTextField.text = self.song.artist;
        self.artistTextField.userInteractionEnabled = NO;
        self.trackNameTextField.text = self.song.trackName;
        self.trackNameTextField.userInteractionEnabled = NO;
        self.lyricsTextView.text = self.song.lyrics;
        [self updateRating:self.song.rating];
        
        self.navigationItem.rightBarButtonItem = nil;
        [self.searchButton removeFromSuperview];
        [self.ratingStepper removeFromSuperview];
        
    } else {
        [self updateRating:(NSInteger)self.ratingStepper.value];
        self.title = @"New Song Lyrics";
    }
}

- (IBAction)saveSong:(id)sender {
    NSString *artist = self.artistTextField.text;
    NSString *trackName = self.trackNameTextField.text;
    NSString *lyrics = self.lyricsTextView.text;
    NSInteger rating = (NSInteger)self.ratingStepper.value;
    
    [self.songController createLyricsWithArtist:artist andTrackName:trackName andLyrics:lyrics andRating:rating];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)incrementRating:(id)sender {
    NSInteger rating = (NSInteger)self.ratingStepper.value;
    [self updateRating:rating];
}

- (IBAction)searchForLyrics:(id)sender {
    NSString *artist = self.artistTextField.text;
    NSString *trackName = self.trackNameTextField.text;
    
    [self.songController fetchSongLyrics:artist andTrackName:trackName withCompletion:^(NSString *lyrics) {
        self.lyricsTextView.text = lyrics;
    }];
}

- (void)updateRating: (NSInteger)rating {
    [self.ratingLabel.text = [NSString stringWithFormat:@"Rating: %ld", rating];
}

@end
