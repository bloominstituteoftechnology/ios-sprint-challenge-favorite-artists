//
//  IIISongViewController.m
//  Lyric Finder
//
//  Created by Ilgar Ilyasov on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "IIISongViewController.h"
#import "IIISong.h"

@interface IIISongViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;
@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;
@property (weak, nonatomic) IBOutlet UIButton *searchLyricsButton;

@end

@implementation IIISongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (IBAction)ratingStepperTapped:(id)sender
{
    
}

- (IBAction)searchLyricsTapped:(id)sender
{
    
}

- (IBAction)saveTapped:(id)sender
{
    
}

- (void)updateViews
{
    if (self.isViewLoaded) {
        if (self.song) {
            self.songTitleTextField.text = self.song.title;
            self.artistTextField.text = self.song.artist;
            self.lyricsTextView.text = self.song.lyrics;
            
            self.navigationItem.title = self.song.title;
            [self.searchLyricsButton setHidden:YES];
        } else {
            self.navigationItem.title = @"New Lyrics";
            [self.searchLyricsButton setHidden:NO];
        }
    }
}

- (void)setSong:(IIISong *)song
{
    _song = song;
    [self updateViews];
}

@end
