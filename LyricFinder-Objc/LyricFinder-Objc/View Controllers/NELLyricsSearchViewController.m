//
//  NELLyricsSearchViewController.m
//  LyricFinder-Objc
//
//  Created by Nelson Gonzalez on 3/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import "NELLyricsSearchViewController.h"
#import "NELLyricController.h"
#import "NELLyric.h"

@class NELLyricController;

@interface NELLyricsSearchViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;
@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;

@end

@implementation NELLyricsSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews
{
    if (!self.isViewLoaded || !self.song) {
        self.navigationItem.title = @"New Lyrics";
        return;}
    
    self.title = self.song.title;
    self.songTitleTextField.text = self.song.title;
    self.artistTextField.text = self.song.artist;
    self.lyricsTextView.text = self.song.lyrics;
    self.ratingLabel.text = [NSString stringWithFormat:@"%i", (int)self.song.rating];
}


- (IBAction)ratingStepperPressed:(id)sender {
    
    self.ratingStepper.maximumValue = 5;
    double value = [self.ratingStepper value];
    self.ratingLabel.text = [NSString stringWithFormat:@"%.0f", value];
    
}

- (IBAction)searchForLyricsButtonPressed:(id)sender {
    
    NSString *artist = self.artistTextField.text;
    NSString *songTitle = self.songTitleTextField.text;
    
    [self.lyricController searchLyricsWithTitle:songTitle artist:artist completion:^(NSString * _Nonnull lyrics, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.lyricsTextView.text  = lyrics;
        });
    }];
    
    
    
}
- (IBAction)saveButtonPressed:(id)sender {
    NSString *title = self.songTitleTextField.text;
    NSString *lyric = self.lyricsTextView.text;
    NSString *artist = self.artistTextField.text;
    int rating = [self.ratingLabel.text intValue];
    
    if (![title isEqualToString:@""]) {
        [self.lyricController addSongWithTitle:title artist:artist lyric:lyric rating:rating];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)setSong:(NELLyric *)song
{
    //Anything in here before _task = task is the "willSet"
    if (song != _song) {
        _song = song;
        //Anything here after _task = task is the "didSet"
        [self updateViews];
    }
}


@end
