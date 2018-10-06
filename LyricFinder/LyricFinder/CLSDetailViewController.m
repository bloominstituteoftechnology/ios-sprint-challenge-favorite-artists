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
    //[self updateViews];
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

- (IBAction)changeRating:(id)sender
{
    NSInteger rating = (NSInteger)self.stepperView.value;
    [self setRatingTextWithRating: rating];
}

- (IBAction)save:(id)sender
{
    NSString *title = self.titleTextField.text;
    NSString *artist = self.artistTextField.text;
    NSString *lyrics = self.lyricsTextView.text;
    NSInteger rating = (NSInteger)self.stepperView.value;;
    
    [_songController createSongWithTitle:title artist:artist lyrics:lyrics rating:rating];
    
    [self.navigationController popViewControllerAnimated:YES];
}

//- (void)updateViews
//{
//    if (self.song)
//    {
//        self.title = self.song.title;
//        self.titleTextField.text = self.song.title;
//        self.titleTextField.userInteractionEnabled = NO;
//        
//        self.artistTextField.text = self.song.artist;
//        self.artistTextField.userInteractionEnabled = NO;
//        
//        self.lyricsTextView.text = self.song.lyrics;
//        
//        [self setRatingTextWithRating:self.song.rating];
//        
//        [self.searchButton removeFromSuperview];
//        [self.stepperView removeFromSuperview];
//        
//        self.navigationItem.rightBarButtonItem = nil;
//    }
//    else
//    {
//        [self setRatingTextWithRating: (NSInteger)self.stepperView.value];
//        self.title = @"New Song Lyrics";
//    }
//}

- (void)setRatingTextWithRating:(NSInteger)rating
{
    self.ratingsLabel.text = [NSString stringWithFormat:@"%ld", rating];
}


@end
