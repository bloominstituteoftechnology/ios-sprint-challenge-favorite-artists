//
//  NKTSongVC.m
//  lyricFinderObjc
//
//  Created by Nikita Thomas on 1/25/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import "NKTSongVC.h"
#import "NKTSong.h"

@interface NKTSongVC ()

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;

@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;


@end

@implementation NKTSongVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diamond"]];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    NSString *title = [[self song] title];
    NSString *artist = [[self song] artist];
    NSString *rating = [NSString stringWithFormat:@"%ld",(long)[[self song] rating]];
    NSString *lyrics = [[self song] lyrics];
    
    // Check to see if we already have a song or if we're going to be searching for a song
    
    if (title && artist && rating && lyrics)
    {
        [[self titleTextField]setText:title];
        [[self artistTextField]setText:artist];
        [[self lyricsTextView]setText:lyrics];
        [[self ratingLabel]setText:rating];
    }
    
    
}

- (IBAction)ratingStepperTapped:(id)sender {
    
    // Get value of rating from the stepper as a double
    double rating = [[self ratingStepper] value];
    
    // Convert the double into a NSNumber
    NSNumber *ratingNumber = [NSNumber numberWithDouble:rating];
    
    // Present the stringValue of the NSNumber as the label
    [[self ratingLabel] setText:ratingNumber.stringValue];
    
}

- (IBAction)saveButtonTapped:(id)sender {
    
    NSString *title = [[self titleTextField] text];
    NSString *artist = [[self artistTextField] text];
    NSString *lyrics = [[self lyricsTextView] text];
    NSInteger rating = (NSInteger)[[self ratingStepper] value];
    
    if (self.song){
        // We already have a song so just update it
        
        [[self songController]updateSong:self.song title:title artist:artist lyrics:lyrics rating:rating];
        [[self navigationController]popViewControllerAnimated:YES];
    } else {
        // This is a new song
        if (title && artist && lyrics && rating)
        {
            [[self songController]newSongWithTitle:title artist:artist rating:rating lyrics:lyrics];
            
            [[self navigationController]popViewControllerAnimated:YES];
        }
    }
    
    

}

- (IBAction)searchForLyricsTapped:(id)sender {
    
    NSString *title = [[self titleTextField]text];
    NSString *artist = [[self artistTextField] text];
    
    [[self songController] getLyricsWithTitle:title artist:artist completion:^(NSString *lyrics, NSError *error) {
        
        if (error)
        {
            NSLog(@"Error searching for lyrics: %@", error);
            return;
        }
        
        // MUST update lyrics text on main que because search is done on background thread
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self lyricsTextView] setText:lyrics];
        });
        
        
        
    }];
    
}


@end
