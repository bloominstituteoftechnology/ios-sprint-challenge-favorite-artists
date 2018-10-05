//
//  CLSDetailViewController.m
//  LyricFinder
//
//  Created by Carolyn Lea on 10/5/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

#import "CLSDetailViewController.h"

@interface CLSDetailViewController () <UITextViewDelegate, UITextFieldDelegate>

@end

@implementation CLSDetailViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if(_song != nil)
    {
        self.artistTextField.text = self.song.artist;
        self.titleTextField.text = self.song.title;
        self.lyricsTextView.text = self.song.lyrics;
        self.ratingsLabel.text = [NSString stringWithFormat:@"%li", (long)self.song.rating];
        self.title = @"Edit Song";
    }
    else
    {
        self.artistTextField.text = @"";
        self.titleTextField.text = @"";
        self.lyricsTextView.text = @"";
        self.ratingsLabel.text = @"0";
        self.title = @"Search Lyrics";
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _artistTextField.delegate = self;
    _titleTextField.delegate = self;
    _lyricsTextView.delegate = self;
}

- (IBAction)search:(id)sender
{
    NSString *title = self.titleTextField.text;
    NSString *artist = self.artistTextField.text;
    
    [self.songController searchForSongWithArtist:artist trackName:title completion:^(NSString *lyrics, NSError *error) {
        
        if (error) {
            NSLog(@"Error fetching song lyrics: %@", error);
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.lyricsTextView.text = lyrics;
            
        });
    }];
}

-(IBAction)valueChanged:(UIStepper *)sender
{
    sender = _stepperView;
    double value = [sender value];
    [_ratingsLabel setText:[NSString stringWithFormat:@"%d", (int)value]];
}

- (IBAction)save:(id)sender
{
    if(_song != nil)
    {
        _song.title = self.titleTextField.text;
        _song.artist = self.artistTextField.text;
        _song.lyrics = self.lyricsTextView.text;
        _song.rating = self.stepperView.value;
    }
    else
    {
        NSString *title = self.titleTextField.text;
        NSString *artist = self.artistTextField.text;
        NSString *lyrics = self.lyricsTextView.text;
        NSString *ratings = [NSString stringWithFormat: @"%f",self.stepperView.value];
        
        [_songController createSongWithTitle:title artist:artist lyrics:lyrics rating:(int)ratings];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
