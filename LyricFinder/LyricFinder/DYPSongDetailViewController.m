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
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *subtractButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

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
    
    NSString *songTitle = self.songTitleTextField.text;
    NSString *artistName = self.artistNameTextField.text;
    
    if (songTitle && artistName) {
        [self.songController searchLyricsForSongTitle:songTitle artistName:artistName completion:^(NSString * _Nullable lyrics, NSError * _Nullable error) {
            
            if (error) {
                NSLog(@"Error searching for lyrics.");
                return;
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.lyricsTextView setText:lyrics];
            });
            
        }];
    }
    
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
        [self.addButton setHidden:YES];
        [self.subtractButton setHidden:YES];
        [self.saveButton setEnabled:NO];
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
