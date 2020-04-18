//
//  SongDetailViewController.m
//  

#import "SongDetailViewController.h"
#import "ALWSong.h"

@interface SongDetailViewController ()

- (IBAction)stepperChanged:(id)sender;
- (IBAction)searchButton:(id)sender;

@end

@implementation SongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stepperOutlet.maximumValue = 5;
    
    [self updateViews];
}

- (void)updateViews {
    if (!self.isViewLoaded || !self.song) { return; }
    
    // If it's nil, set title - if existing, set title to name of song
    self.title = self.song.title ?: @"New Song Lyrics";
    
    // Populate text for existing song
    self.songTitleTextField.text = self.song.title;
    self.artistTextField.text = self.song.artist;
    self.lyricsTextView.text = self.song.lyrics;
    self.songRatingLabel.text = [NSString stringWithFormat:@"Rating: %ld", (long)self.song.rating];
    
    // Hide button and stepper when showing existing song
    self.searchButtonOutlet.hidden = YES;
    self.stepperOutlet.hidden = YES;
}

- (IBAction)stepperChanged:(id)sender {
    
    self.songRatingLabel.text = [NSString stringWithFormat:@"Rating: %d", [[NSNumber numberWithDouble: [(UIStepper *)sender value]] intValue]];
}

- (IBAction)searchButton:(id)sender {
    
    [self.songController searchForLyricsWithArtist:self.artistTextField.text title:self.songTitleTextField.text withCompletionBlock:^(ALWSong * _Nonnull song, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.lyricsTextView.text = _songController.savedSong.lyrics;
            NSLog(@"%@", _songController.savedSongs);
            [self updateViews];
        });
    }];
    
}

//// Equivalent of didSet
//- (void)setSong:(ALWSong *)song {
//    _song = song;
//    [self updateViews];
//}


- (IBAction)save:(UIBarButtonItem *)sender {
    
    // Editing if self.song does not equal nil
    BOOL isEditingSong = self.song != nil;
    
    // Editing = self.song | Creating = initialize
    self.songController.savedSong = self.song ?: [[ALWSong alloc] init];
    
//    ALWSong *song = self.song ?: [[ALWSong alloc] init];
//    song.title = self.songTitleTextField.text;
//    song.artist = self.artistTextField.text;
//    song.lyrics = self.lyricsTextView.text;
//    song.rating = self.stepperOutlet.value;
    
    self.songController.savedSong.title = self.songTitleTextField.text;
    self.songController.savedSong.artist = self.artistTextField.text;
    self.songController.savedSong.lyrics = self.lyricsTextView.text;
    self.songController.savedSong.rating = self.stepperOutlet.value;
    
    if (!isEditingSong) {
        [self.songController addSong: self.songController.savedSong];
        //[self.songController addSong:song];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}





@end
