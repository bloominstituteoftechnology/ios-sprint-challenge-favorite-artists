//
//  JKSongDetailViewController.m
//  LyricFinder
//
//  Created by TuneUp Shop  on 3/1/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import "JKSongDetailViewController.h"


@interface JKSongDetailViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *ratingValueLabel;

@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;

@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;

@property (weak, nonatomic) IBOutlet UITextField *artistNameTextField;

@property (weak, nonatomic) IBOutlet UIButton *searchForLyricsButton;

@property (weak, nonatomic) IBOutlet UITextView *songLyricsTextView;


- (IBAction)valueChanged:(UIStepper *)sender;

@end

@implementation JKSongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.songTitleTextField.delegate = self;
    self.artistNameTextField.delegate = self;
    self.songLyricsTextView.delegate = self;
    [self hideSearchView];
    [self updateViews];
    
}

- (void)setSong:(JKSong *)song {
    _song = song;
    [self updateViews];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveSongButtonTapped:(id)sender {

    if (self.song == nil) { return; }
    self.song.jKSongRating = ratingStepperValue;
    [self.lyricFinderController saveSong:self.song];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)searchForLyricsButtonTapped:(id)sender {
    NSString *title = _songTitleTextField.text;
    NSString *artist = _artistNameTextField.text;
    if (title.length == 0 || artist.length == 0) { return; }
    
    [self.lyricFinderController fetchSongInfoByArtist:artist andWithTitle:title withBlock:^(JKSong * _Nullable song, NSError * _Nullable error) {
        
        self.song = song;


    }];
}


// Big thanks to @Dave DeLong for his fantastic 10-15-2011 SO answer on this...
///https://stackoverflow.com/questions/7779443/how-to-use-uistepper
- (IBAction)valueChanged:(UIStepper *)sender {
    int value = [sender value];
    
    ratingStepperValue = [NSNumber numberWithDouble:value];
 
    [_ratingValueLabel setText:[NSString stringWithFormat:@"%@", ratingStepperValue]];
}

#pragma mark -Private Methods

- (void)hideSearchView {
    if (self.song == nil) {return;}
    self.searchForLyricsButton.hidden = YES;
}

- (void)updateViews {
    if (self.isViewLoaded == NO) { return; }
    
    if (self.song == nil) {
        self.title = @"New Song Lyrics";
        self.songLyricsTextView.text = @"Search for a song to find the lyrics";
    }else {
        self.title = self.song.songTitle;
        self.songTitleTextField.text = self.song.songTitle;
        self.artistNameTextField.text = self.song.artistName;
        self.songLyricsTextView.text = self.song.songLyrics;
        
        if (self.song.jKSongRating == NULL) { self.song.jKSongRating = [NSNumber numberWithInt:(0)]; }
        [_ratingValueLabel setText:[NSString stringWithFormat:@"%@", self.song.jKSongRating]];
    }
}


@end
