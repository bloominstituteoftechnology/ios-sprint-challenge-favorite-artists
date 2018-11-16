//
//  DYPSongDetailViewController.m
//  LyricFinder
//
//  Created by Daniela Parra on 11/16/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

#import "DYPSongDetailViewController.h"
#import "DYPSongController.h"
#import "DYPSong.h"

@interface DYPSongDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ratingsLabel;
@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistNameTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;
@property NSInteger rating;

@end

@implementation DYPSongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.song) {
        self.rating = 0;
    }
    [self updateViews];
}

- (IBAction)searchForLyrics:(id)sender {
}

- (IBAction)addToRating:(id)sender {
    
    self.rating += 1;
    [self updateViews];
}

- (IBAction)subtractFromRating:(id)sender {
    
    self.rating -= 1;
    [self updateViews];
}

- (IBAction)saveSong:(id)sender {
    
    [self.songController addASongWithTitle:self.songTitleTextField.text artistName:self.artistNameTextField.text lyrics:self.lyricsTextView.text rating:self.rating];
    self.rating = 0;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateViews
{
    if (self.song) {
        self.rating = self.song.rating;
        
        [self.navigationController setTitle:self.song.title];
        [self.artistNameTextField setText:self.song.artistName];
        [self.songTitleTextField setText:self.song.title];
        [self.lyricsTextView setText:self.song.lyrics];
        NSString *ratingString = [NSString stringWithFormat:@"Ratings: %ld", (long)self.rating];
        [self.ratingsLabel setText:ratingString];
    } else {
        NSString *ratingString = [NSString stringWithFormat:@"Ratings: %ld", (long)self.rating];
        [self.ratingsLabel setText:ratingString];
    }
}

- (void)setSong:(DYPSong *)song
{
    _song = song;
    [self updateViews];
}
@end
