//
//  MJRSongDetailViewController.m
//  Lyric Finder
//
//  Created by Moses Robinson on 3/29/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

#import "MJRSongDetailViewController.h"
#import "MJRSongController.h"
#import "MJRSong.h"

@interface MJRSongDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) IBOutlet UIStepper *ratingStepper;
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *artistTextField;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) IBOutlet UITextView *lyricsTextView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;


@end

@implementation MJRSongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (IBAction)save:(id)sender {
    
    NSString *title = self.titleTextField.text;
    NSString *artist = self.artistTextField.text;
    NSString *lyrics = self.lyricsTextView.text;
    NSInteger rating = (int)self.ratingStepper.value;
    
    [self.songController createSongWithTitle:title artist:artist lyrics:lyrics rating:rating];

    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)changeRating:(id)sender {
    
    [self.ratingLabel setText:[NSString stringWithFormat:@"Rating: %d", (int)self.ratingStepper.value]];
}

- (IBAction)searchForLyrics:(id)sender {
    
    NSString *artist = self.artistTextField.text;
    NSString *title = self.titleTextField.text;
    
    [self.songController fetchLyricsWithTitle:title artist:artist completion:^(NSString *lyrics, NSError *error) {
        
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.lyricsTextView.text = @"Error was found, since API is not working. Fun.";
            });
            return;
        }
        
        if (!lyrics) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.lyricsTextView.text = @"Not lyrics were found, since API is not working. Fun.";
            });
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.lyricsTextView.text = lyrics;
        });
    }];
}

- (void)updateViews
{
    if (!self.isViewLoaded || !self.song) { return; }
    
    self.title = self.song.title;
    
    self.titleTextField.text = self.song.title;
    self.artistTextField.text = self.song.artist;
    self.lyricsTextView.text = self.song.lyrics;
    [self.ratingLabel setText:[NSString stringWithFormat:@"Rating: %d", (int)self.song.rating]];
    
    self.navigationItem.rightBarButtonItem = nil;
    [self.searchButton removeFromSuperview];
    [self.ratingStepper removeFromSuperview];
}

- (void)setSong:(MJRSong *)song
{
    if (song != _song) {
        
        _song = song;
        [self updateViews];
    }
}

@end
