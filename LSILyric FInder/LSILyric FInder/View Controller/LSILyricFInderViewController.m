//
//  LSILyricFInderViewController.m
//  LSILyric FInder
//
//  Created by Iyin Raphael on 3/8/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSILyricFInderViewController.h"
#import "LSILyricsController.h"
#import "lSILyric.h"

@interface LSILyricFInderViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

- (IBAction)ratingStepper:(UIStepper *)sender;

@property (weak, nonatomic) IBOutlet UIStepper *ratingStep;


@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistNameTextField;
- (IBAction)searchButtonTapped:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;
- (IBAction)save:(id)sender;

-(void) updateViews;

-(void) updateRating: (int) rating;

@end

@implementation LSILyricFInderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.updateViews;
}





- (IBAction)searchButtonTapped:(UIButton *)sender {
    
    NSString *artistName = self.artistNameTextField.text;
    NSString *title = self.songTitleTextField.text;
    
    if (artistName && ![artistName isEqualToString:@""] && ![title isEqualToString:@""]){
        [self.lyricsController fetchLyricswithArtistName:artistName title:title completionBlock:^ (NSString *lyricsBody, NSError *error) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self.lyricsTextView setText:lyricsBody];
            });
        }];
    }
    
}
- (IBAction)save:(id)sender
{
    
    NSString *artistName = self.artistNameTextField.text;
    NSString *title = self.songTitleTextField.text;
    NSString *lyrics = self.lyricsTextView.text;
    NSInteger rating = self.ratingStep.value;
    
    [self.lyricsController createLyrics:artistName title:title lyrics:lyrics rating:rating];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)updateViews
{
    if (self.song)
    {
        [self setTitle:self.song.title];
        self.artistNameTextField.text = self.song.artistName;
        self.songTitleTextField.text = self.song.title;
        self.lyricsTextView.text = self.song.lyrics;
        self.ratingStep.value = self.song.rating;
        
    } else{
        [self setTitle:@"Add New Lyrics"];
    }
}


- (void)updateRating:(int)rating
{
    self.ratingLabel.text = @"Rating: %@", rating;
}


- (IBAction)ratingStepper:(UIStepper *)sender {
     [self updateRating:sender.value];
}
@end
