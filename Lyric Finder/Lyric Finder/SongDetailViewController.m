//
//  SongDetailViewController.m
//  Lyric Finder
//
//  Created by Moin Uddin on 11/16/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

#import "SongDetailViewController.h"
#import "SongController.h"
@interface SongDetailViewController ()
@property (nonatomic) NSString *lyrics;
@property (nonatomic) NSInteger *rating;
@end

@implementation SongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

-(void)updateViews
{
    if(self.song) {
        _artistTextField.text = self.song.artist;
        _songTitleTextField.text = self.song.title;
        _songLyricsTextView.text = self.song.lyrics;
        NSNumber *num = [NSNumber numberWithInteger:self.song.rating];
        _ratingLabel.text = [num stringValue];
        self.rating = self.song.rating;
        self.lyrics = self.song.lyrics;
    }
}

- (IBAction)stepper:(UIStepper *)sender {
    NSNumber *doubleNumber = [NSNumber numberWithDouble:sender.value];
    if(self.rating) {
        NSInteger *num = (int)self.rating + (int)sender.value;
        _ratingLabel.text = [[NSNumber numberWithInteger:num] stringValue];
        self.rating = num;
    } else {
        _ratingLabel.text = [doubleNumber stringValue];
    }
}
- (IBAction)searchForLyrics:(id)sender {
    [self.songController searchForLyricsWithTitle:_songTitleTextField.text artist:_artistTextField.text completion:^(NSString *lyrics, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.lyrics = lyrics;
            self.songLyricsTextView.text = lyrics;
        });
    }];
}
- (IBAction)saveSong:(id)sender {
    if (!self.song) {
        [self.songController createSongWithTitle:_songTitleTextField.text artist:_artistTextField.text lyrics:self.lyrics rating:self.rating];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self.songController updateSongWithSong:self.song title:_songTitleTextField.text artist:_artistTextField.text lyrics:self.lyrics rating:self.rating];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
