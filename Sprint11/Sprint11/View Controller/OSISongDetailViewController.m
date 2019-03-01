//
//  OSISongDetailViewController.m
//  Sprint11
//
//  Created by Sergey Osipyan on 3/1/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import "OSISongDetailViewController.h"
#import "OSISongController.h"
#import "OSISong.h"

@interface OSISongDetailViewController ()
//@property OSISong *song;
//@prope(nonatomic) rty OSISongController *osiSongController;

@property (weak, nonatomic) IBOutlet UILabel *songRating;
@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *textBodyTextView;
@property (weak, nonatomic) IBOutlet UINavigationItem *songNavigationItem;
- (IBAction)saveButton:(id)sender;
- (IBAction)stepperAction:(id)sender;
- (IBAction)searchButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIStepper *stepperOutlet;
@end

@implementation OSISongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)saveButton:(id)sender {
    if (!self.song) {
    NSString *title = self.songTitleTextField.text;
    NSString *artist = self.artistTextField.text;
    NSString *lyrics = self.textBodyTextView.text;
    NSInteger rating = [self.songRating.text intValue];
    
    [_osiSongController createSong:title artist:artist lyrics:lyrics rating:rating];
    } else {
        
        [_osiSongController updateSong:_song rating:_songRating.text];
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)searchButton:(id)sender {
    [_osiSongController searchForSong:_artistTextField.text trackName:_songTitleTextField.text completion:^(NSDictionary * _Nonnull song, NSError *error) {
       
        dispatch_async(dispatch_get_main_queue(), ^{
        self.textBodyTextView.text = song[@"lyrics_body"];
        });
    }];
}

- (void)stepperAction:(UIStepper *)sender {
    if (self.song) {
        
        NSNumber *ratingValue = @(sender.value);
        NSString *ratingString = [NSNumberFormatter localizedStringFromNumber:ratingValue numberStyle:NSNumberFormatterDecimalStyle];
        self.songRating.text = ratingString;
    } else {
         [_stepperOutlet setValue:5];
        NSNumber *ratingValue = @(sender.value);
        NSString *ratingString = [NSNumberFormatter localizedStringFromNumber:ratingValue numberStyle:NSNumberFormatterDecimalStyle];
        _songRating.text = ratingString;
    }
    
}

- (void)updateViews {
    if (self.isViewLoaded == NO) { return ;}

    if (self.song == nil) {
        self.title = @"New Song Lyrics";
        self.songRating.text = @"Rating: 5";
        self.songTitleTextField.text = @"";
        self.textBodyTextView.text = @"";
        self.artistTextField.text = @"";
    } else {
        self.title = self.song.title;
        self.songRating.text = [NSString stringWithFormat:@"%li", (long)self.song.rating];
        self.songTitleTextField.text = self.song.title;
        self.textBodyTextView.text = self.song.lyrics;
        self.artistTextField.text = self.song.artist;
    }
}




@end
