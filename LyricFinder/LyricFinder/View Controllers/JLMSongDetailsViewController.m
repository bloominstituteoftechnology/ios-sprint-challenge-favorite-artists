//
//  JLMSongDetailsViewController.m
//  LyricFinder
//
//  Created by Jason Modisett on 1/25/19.
//  Copyright © 2019 Jason Modisett. All rights reserved.
//

#import "JLMSongDetailsViewController.h"
#import "JLMSongController.h"

@interface JLMSongDetailsViewController ()

-(void)hideKeyboard;

@property (nonatomic) NSString *lyrics;
@property (nonatomic) NSInteger rating;

@end

@implementation JLMSongDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *hideKeyboard = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:hideKeyboard];
    [self updateViews];
}

-(void)updateViews
{
    
    if(self.song) {
        [self setTitle:self.song.title];
        _artistTextField.text = self.song.artist;
        _songTitleTextField.text = self.song.title;
        _songLyricsTextView.text = self.song.lyrics;
        [self.navigationController setTitle:self.song.title];
        NSNumber *num = [NSNumber numberWithInteger:self.song.rating];
        _ratingLabel.text = [num stringValue];
        [self.stepper setValue:self.song.rating];
        self.rating = self.song.rating;
        self.lyrics = self.song.lyrics;
    } else {
        [self setTitle:@"Find new lyrics"];
    }
}

-(void)hideKeyboard
{
    [self resignFirstResponder];
}

- (IBAction)stepper:(UIStepper *)sender {
    _ratingLabel.text = [[NSNumber numberWithDouble:sender.value] stringValue];
}

- (IBAction)searchForLyrics:(id)sender {
    
    [self.songTitleTextField resignFirstResponder];
    [self.artistTextField resignFirstResponder];
    [self resignFirstResponder];
    
    [self.songController searchForLyricsWithTitle:_songTitleTextField.text artist:_artistTextField.text completion:^(NSString *lyrics, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.lyrics = lyrics;
            self.songLyricsTextView.text = lyrics;
        });
    }];
}

- (IBAction)saveSong:(id)sender {
    
    NSInteger rating = [self.stepper value];
    
    if (!self.song) {
        [self.songController createSongWithTitle:_songTitleTextField.text artist:_artistTextField.text lyrics:self.lyrics rating:rating];
        [self.navigationController popViewControllerAnimated:YES];
        
    } else {
        [self.songController updateSongWithSong:self.song title:_songTitleTextField.text artist:_artistTextField.text lyrics:self.lyrics rating:rating];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
