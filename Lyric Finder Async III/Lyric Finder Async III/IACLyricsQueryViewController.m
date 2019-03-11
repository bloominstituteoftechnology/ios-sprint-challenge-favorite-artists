//
//  IACLyricsQueryViewController.m
//  Lyric Finder Async III
//
//  Created by Ivan Caldwell on 3/10/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import "IACLyricsQueryViewController.h"

@interface IACLyricsQueryViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;
@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;

@end

@implementation IACLyricsQueryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)searchButtonTapped:(id)sender {
    // Check this over again...
    [self.lyricsController fetchLyricsForTitle:_titleTextField.text artist:_artistTextField.text completionBlock:^(IACSong *song, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.lyricsTextView.text = song.lyrics;
        });
    }];
}

- (IBAction)saveButtonTapped:(id)sender {
    NSString *title = _titleTextField.text;
    NSString *artist = _artistTextField.text;
    NSString *lyrics = _lyricsTextView.text;
    int rating = (int)_ratingStepper.value;
    
    if (title.length == 0  || artist.length == 0) {
        return;
    } else if (_song) {
        [self.lyricsController updateSong: self.song rating: rating];
    } else {
        [self.lyricsController createSongWithTitle:title artist:artist lyrics:lyrics rating:rating];
        NSLog(@"Created a new song");
    }
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)ratingStepperTapped:(id)sender {
    NSString *ratingString = [NSString stringWithFormat:@"Rating: %i", (int)_ratingStepper.value];
    _ratingLabel.text = ratingString;
}

@end
