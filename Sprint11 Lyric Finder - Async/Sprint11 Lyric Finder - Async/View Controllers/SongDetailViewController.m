//
//  SongDetailViewController.m
//  

#import "SongDetailViewController.h"
#import "ALWSong.h"

@interface SongDetailViewController ()

- (IBAction)stepperChanged:(id)sender;
- (IBAction)searchButton:(id)sender;
- (IBAction)save:(id)sender;

@end

@implementation SongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews {
    if (!self.isViewLoaded || !self.song) { return; }
    
    // If it's nil, set title - if existing, set title to name of song
    self.title = self.song.title ?: @"New Song Lyrics";
    
    self.songTitleTextField.text = self.song.title;
    self.artistTextField.text = self.song.artist;
    self.lyricsTextView.text = self.song.lyrics;
    self.songRatingLabel.text = [NSString stringWithFormat:@"Rating: %ld", (long)self.song.rating];
}

- (IBAction)stepperChanged:(id)sender {
    
    self.songRatingLabel.text = [NSString stringWithFormat:@"Rating: %d", [[NSNumber numberWithDouble: [(UIStepper *)sender value]] intValue]];
}

- (IBAction)searchButton:(id)sender {
    
    [self.songController searchForLyricsWithArtist:self.artistTextField.text title:self.songTitleTextField.text withCompletionBlock:^(ALWSong * _Nonnull song, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            //_songController.savedSongs = songs;
            [self updateViews];
        });
    }];
    
}

- (IBAction)save:(id)sender {
    
    // Editing if self.song does not equal nil
    BOOL isEditingSong = self.song != nil;
    
    // Editing = self.song | Creating = initialize
    ALWSong *song = self.song ?: [[ALWSong alloc] init];
    song.title = self.songTitleTextField.text;
    song.artist = self.artistTextField.text;
    song.lyrics = self.lyricsTextView.text;
    song.rating = [[NSNumber numberWithDouble: [(UIStepper *)sender value]] intValue];
    
    if (!isEditingSong) {
        [self.songController addSong:song];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

//// Equivalent of didSet
//- (void)setSong:(ALWSong *)song {
//    _song = song;
//    [self updateViews];
//}

@end
