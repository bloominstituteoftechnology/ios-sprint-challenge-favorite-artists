//
//  IIISongViewController.m
//  Lyric Finder
//
//  Created by Ilgar Ilyasov on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "IIISongViewController.h"
#import "IIISongController.h"
#import "IIISong.h"

@interface IIISongViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;
@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;
@property (weak, nonatomic) IBOutlet UIButton *searchLyricsButton;

@end

@implementation IIISongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    self.songTitleTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.artistTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
}

- (IBAction)ratingStepperTapped:(id)sender
{
    self.ratingStepper.maximumValue = 5;
    double value = [self.ratingStepper value];
    self.ratingLabel.text = [NSString stringWithFormat:@"%.0f", value];
}

- (IBAction)searchLyricsTapped:(id)sender
{
    NSString *title = self.songTitleTextField.text;
    NSString *artist = self.artistTextField.text;
    
    [self.songController searchLyricsWithArtist:artist title:title completion:^(NSString * _Nonnull lyrics, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.lyricsTextView.text = lyrics;
        });
    }];
}

- (IBAction)saveTapped:(id)sender
{
    NSString *title = self.songTitleTextField.text;
    NSString *artist = self.artistTextField.text;
    NSString *lyrics = self.lyricsTextView.text;
    int rating = [self.ratingLabel.text intValue];
    
    [self.songController createSongWithTitle:title artist:artist lyrics:lyrics rating:rating];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateViews
{
    if (self.isViewLoaded) {
        if (self.song) {
            self.songTitleTextField.text = self.song.title;
            self.artistTextField.text = self.song.artist;
            self.lyricsTextView.text = self.song.lyrics;
            
            // This is acting weird. Don't have enought time spend this right now
            self.ratingLabel.text = [NSString stringWithFormat:@"%i", (int)self.song.rating];
            
            self.navigationItem.title = self.song.title;
            [self.ratingStepper setHidden:YES];
            [self.searchLyricsButton setHidden:YES];
        } else {
            self.navigationItem.title = @"New Lyrics";
            [self.searchLyricsButton setHidden:NO];
        }
    }
}

#pragma mark Setter

// This method gets called everytime song's value is changed
- (void)setSong:(IIISong *)song
{
    _song = song;
    [self updateViews];
}

@end
