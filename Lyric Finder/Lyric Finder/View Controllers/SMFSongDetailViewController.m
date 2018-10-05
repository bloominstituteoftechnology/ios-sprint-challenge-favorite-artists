//
//  SMFSongDetailViewController.m
//  Lyric Finder
//
//  Created by Samantha Gatt on 10/5/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import "SMFSongDetailViewController.h"
#import "SMFSong+CoreDataClass.h"
#import "SMFSongController.h"

@interface SMFSongDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

- (IBAction)changeRating:(id)sender;
- (IBAction)search:(id)sender;
- (IBAction)save:(id)sender;

@end

@implementation SMFSongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ratingStepper.minimumValue = 0.0;
    self.ratingStepper.maximumValue = 5.0;
    self.lyricsTextView.editable = NO;
    
    if (self.song) {
        NSNumber *rating = [NSNumber numberWithInteger:self.song.rating];
        
        self.title = self.song.title;
        self.ratingLabel.text = [NSString stringWithFormat:@"Rating: %i", (int)rating.integerValue];
        self.ratingStepper.value = rating.doubleValue;
        self.titleTextField.text = self.song.title;
        self.titleTextField.enabled = NO;
        self.artistTextField.text = self.song.artist;
        self.artistTextField.enabled = NO;
        self.searchButton.hidden = YES;
        self.lyricsTextView.text = self.song.lyrics;
    } else {
        
    }
}

- (IBAction)changeRating:(id)sender {
    NSNumber *rating = [NSNumber numberWithInteger:self.song.rating];
    self.ratingLabel.text = [NSString stringWithFormat:@"Rating: %i", (int)rating.integerValue];
}
- (IBAction)search:(id)sender {
    NSString *title = self.titleTextField.text;
    NSString *artist = self.artistTextField.text;
    [self.songController fetchSongLyricsWithTitle:title artist:artist completionHandler:^(NSString *lyrics, NSError *error) {
        if (error) {
            NSLog(@"Error fetching song lyrics: %@", error);
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.lyricsTextView.text = lyrics;
        });
    }];
}
- (IBAction)save:(id)sender {
    NSNumber *rating = [NSNumber numberWithInteger:self.ratingStepper.value];
    if (self.song) {
        if (self.song.rating != rating.integerValue) {
            [self.songController updateSong:self.song rating:rating.integerValue];
            [self.navigationController popViewControllerAnimated:YES];
        }
    } else {
        NSString *title = self.titleTextField.text;
        NSString *artist = self.artistTextField.text;
        NSString *lyrics = self.lyricsTextView.text;
        [self.songController createWithTitle:title artist:artist lyrics:lyrics rating:rating.integerValue];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
