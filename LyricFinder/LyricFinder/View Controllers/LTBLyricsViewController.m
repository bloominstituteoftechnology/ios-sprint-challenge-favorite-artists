//
//  LTBLyricsViewController.m
//  LyricFinder
//
//  Created by Linh Bouniol on 10/5/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import "LTBLyricsViewController.h"
#import "LTBLyricController.h"
#import "LTBLyric+Convenience.h"

@interface LTBLyricsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;

@end

@implementation LTBLyricsViewController

- (void)setLyrics:(LTBLyric *)lyrics
{
    _lyrics = lyrics;
    
    [self updateViews];
}

- (IBAction)search:(id)sender
{
    [self.lyricController loadLyricsWithTitle:self.titleTextField.text artist:self.artistTextField.text completion:^(NSString * _Nonnull lyric, NSError * _Nonnull error) {
        self.lyricsTextView.text = lyric;
    }];
}

- (IBAction)save:(id)sender
{
    NSString *title = self.titleTextField.text;
    NSString *artist = self.artistTextField.text;
    NSString *lyrics = self.lyricsTextView.text;
    
    if (title.length == 0 || artist.length == 0 || lyrics.length == 0) return;
    
    if (self.lyrics) {
        [self.lyricController updateLyrics:lyrics title:title artist:artist];
    } else {
        [self.lyricController createWithTitle:title artist:artist lyrics:lyrics rating:0];
    }
    
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateViews];
}

- (void)updateViews
{
    if (!self.isViewLoaded) return;
    
    if (self.lyrics) {
        self.navigationItem.title = self.lyrics.title;
        self.titleTextField.text = self.lyrics.title;
        self.artistTextField.text = self.lyrics.artist;
        self.lyricsTextView.text = self.lyrics.lyric;
    } else {
        self.navigationItem.title = @"Create Document";
    }
}

@end
