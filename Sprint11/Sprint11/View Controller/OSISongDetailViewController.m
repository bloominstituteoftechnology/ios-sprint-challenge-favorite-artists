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
    
    self.stepperOutlet.minimumValue = 0;
    self.stepperOutlet.maximumValue = 5;
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self updateViews];
//}

- (void)saveButton:(id)sender {
    if (!self.song) {
    NSString *title = self.songTitleTextField.text;
    NSString *artist = self.artistTextField.text;
    NSString *lyrics = self.textBodyTextView.text;
    NSString *rating = self.songRating.text;
    int stepperValue = self.stepperOutlet.value;
        [_osiSongController createSong:title artist:artist lyrics:lyrics rating:rating stepperValue:stepperValue];
    } else {
        NSNumber *ratingValue = @(_stepperOutlet.value);
        NSString *ratingString = [NSNumberFormatter localizedStringFromNumber:ratingValue numberStyle:NSNumberFormatterDecimalStyle];
        [_osiSongController updateSong:_song rating:[@"Rating: " stringByAppendingString:ratingString] stepperValue:_stepperOutlet.value];
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
    
        
        NSNumber *ratingValue = @((int)sender.value);
        NSString *ratingString = [NSNumberFormatter localizedStringFromNumber:ratingValue numberStyle:NSNumberFormatterDecimalStyle];
        self.songRating.text = [@"Rating: " stringByAppendingString:ratingString];
    
    
}

- (void)updateViews {
    if (self.isViewLoaded == NO) { return ;}

    if (self.song == nil) {
        self.title = @"New Song Lyrics";
        
        NSNumber *ratingValue = @(_stepperOutlet.value);
        NSString *ratingString = [NSNumberFormatter localizedStringFromNumber:ratingValue numberStyle:NSNumberFormatterDecimalStyle];
        self.songRating.text = [@"Rating: " stringByAppendingString:ratingString];
        self.songTitleTextField.text = @"";
        self.textBodyTextView.text = @"";
        self.artistTextField.text = @"";
    } else {
        [self.stepperOutlet setValue:_song.stepperValue];
        NSNumber *ratingValue = @(_song.stepperValue);
        NSString *ratingString = [NSNumberFormatter localizedStringFromNumber:ratingValue numberStyle:NSNumberFormatterDecimalStyle];
        self.songRating.text = [@"Rating: " stringByAppendingString:ratingString];
        self.title = self.song.title;
        self.songRating.text = self.song.rating;
        self.songTitleTextField.text = self.song.title;
        self.textBodyTextView.text = self.song.lyrics;
        self.artistTextField.text = self.song.artist;
    }
}




@end
