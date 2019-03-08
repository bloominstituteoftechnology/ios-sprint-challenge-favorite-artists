//
//  IACLyricsQueryViewController.m
//  Lyric Finder Async
//
//  Created by Ivan Caldwell on 3/8/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import "IACLyricsQueryViewController.h"

@interface IACLyricsQueryViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;
@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;

@end

@implementation IACLyricsQueryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)decreaseButtonTapped:(id)sender {
    NSString *ratingString = [NSString stringWithFormat:@"Rating: %i", (int)_ratingStepper.value];
    _ratingLabel.text = ratingString;
}

- (IBAction)increaseButtonTapped:(id)sender {
    NSString *ratingString = [NSString stringWithFormat:@"Rating: %i", (int)_ratingStepper.value];
    _ratingLabel.text = ratingString;
}

- (IBAction)searchButtonTapped:(id)sender {
}

- (IBAction)saveButtonTapped:(id)sender {
    NSString *title = _songTitleTextField.text;
    NSString *artist = _artistTextField.text;
    NSString *lyrics = _lyricsTextView.text;
    int rating = (int)_ratingStepper.value;
    
    
    if (title.length == 0  || artist.length == 0) {
        return;
    } else if (_song) {
        [self.lyricsController updateLyric: _song rating: rating];
    } else {
        [self.lyricsController createLyricWithTitle:title artist:artist lyrics:lyrics rating:rating];
    }
    [self.navigationController popViewControllerAnimated:true];
}

@end
