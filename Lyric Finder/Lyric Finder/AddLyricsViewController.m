//
//  AddLyricsViewController.m
//  Lyric Finder
//
//  Created by Vuk Radosavljevic on 10/5/18.
//  Copyright © 2018 Vuk. All rights reserved.
//

#import "AddLyricsViewController.h"
#import "Song.h"
#import "SongController.h"


@interface AddLyricsViewController ()


@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;
@property (weak, nonatomic) IBOutlet UITextField *ratingTextField;


- (IBAction)searchForLyrics:(id)sender;

- (IBAction)save:(id)sender;


@end

@implementation AddLyricsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}



- (IBAction)searchForLyrics:(id)sender {
    [self.songController searchForSongWithArtist:self.artistTextField.text trackName:self.songTitleTextField.text completion:^(NSDictionary *song, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.lyricsTextView.text = song[@"lyrics_body"];
        });
    }];
}

- (IBAction)save:(id)sender {
    NSString *title = self.songTitleTextField.text;
    NSString *artist = self.artistTextField.text;
    NSString *lyrics = self.lyricsTextView.text;
    int rating = [self.ratingTextField.text intValue];
    
    [self.songController createSongWithTitle:title artist:artist lyrics:lyrics rating:rating];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)setSong:(Song *)song {
    _song = song;
    [self loadViewIfNeeded];
    self.title = self.song.title;
    self.ratingTextField.text = [NSString stringWithFormat:@"%i", self.song.rating];
    self.songTitleTextField.text = song.title;
    self.lyricsTextView.text = song.lyrics;
    self.artistTextField.text = song.artist;
}

@end
