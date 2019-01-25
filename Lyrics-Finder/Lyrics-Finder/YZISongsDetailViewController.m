//
//  YZISongsDetailViewController.m
//  Lyrics-Finder
//
//  Created by Yvette Zhukovsky on 1/25/19.
//  Copyright © 2019 Yvette Zhukovsky. All rights reserved.
//

#import "YZISongsDetailViewController.h"
#import "YZISongsController.h"
#import "YZISongs.h"

@interface YZISongsDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;
@property (weak, nonatomic) IBOutlet UITextField *songName;
@property (weak, nonatomic) IBOutlet UITextField *artistName;
@property (weak, nonatomic) IBOutlet UIButton *searchLyricsButton;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;


@end

@implementation YZISongsDetailViewController

- (IBAction)save:(id)sender {
    
    NSString *lyrics = self.lyricsTextView.text;
    NSString *artistName = self.artistName.text;
    NSString *title = self.songName.text;
    int rating = [self.ratingLabel.text intValue];
    
    if (![title isEqualToString:@""]) {
        [self.songController createSongsWithTitle:title artistName:artistName lyrics:lyrics  rating:rating];
        [self.navigationController popViewControllerAnimated:YES];
    }

}





- (IBAction)ratingsStepper:(id)sender
{
    double value = [self.ratingStepper value];
    self.ratingLabel.text = [NSString stringWithFormat:@"%.0f", value];
}



- (void)viewDidLoad {
    [super viewDidLoad];
   [self updateViews];
}

- (void)updateViews
{
    if (self.isViewLoaded) {
        self.songName.autocapitalizationType = UITextAutocapitalizationTypeWords;
        self.artistName.autocapitalizationType = UITextAutocapitalizationTypeWords;
        if (self.songs) {
            self.songName.text = self.songs.title;
            self.artistName.text = self.songs.artistName;
            self.lyricsTextView.text = self.songs.lyrics;
            
            
            self.ratingLabel.text = [NSString stringWithFormat:@"%i", (int)self.songs.rating];
            
            self.navigationItem.title = self.songs.title;
            [self.ratingStepper setHidden:YES];
            [self.searchLyricsButton setHidden:YES];
        } else {
            self.navigationItem.title = @"New Song Lyrics";
            [self.searchLyricsButton setHidden:NO];
        }
    }
}

- (void)songAssigner:(YZISongs *)song
{
    _songs = song;
    [self updateViews];
}





- (IBAction)searchLyricsEntered:(id)sender
{
    NSString *artist = self.artistName.text;
    NSString *title = self.songName.text;
    [self.songController searchLyricsWithArtist:artist title:title completion:^(NSString * lyrics, NSError *  error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.lyricsTextView.text = lyrics;
        });
    }];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
