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
}

- (IBAction)ratingStepperTapped:(id)sender
{
    // Update ratingLabel's text
}

- (IBAction)searchLyricsTapped:(id)sender
{
    // SongController FetchLyrics needed
}

- (IBAction)saveTapped:(id)sender
{
    NSString *title = self.songTitleTextField.text;
    NSString *artist = self.artistTextField.text;
    NSString *lyrics = self.lyricsTextView.text;
    NSInteger rating = [self.ratingLabel.text integerValue];
    
    [self.songController createSongWithTitle:title artist:artist lyrics:lyrics rating:rating];
}

- (void)updateViews
{
    if (self.isViewLoaded) {
        if (self.song) {
            self.songTitleTextField.text = self.song.title;
            self.artistTextField.text = self.song.artist;
            self.lyricsTextView.text = self.song.lyrics;
            
            self.navigationItem.title = self.song.title;
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
