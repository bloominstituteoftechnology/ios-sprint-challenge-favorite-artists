//
//  FAFNewSongViewController.m
//  FAFLyricFinder
//
//  Created by Farhan on 11/16/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

#import "FAFNewSongViewController.h"
#import "FAFSong.h"

@interface FAFNewSongViewController ()


@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;

@property (weak, nonatomic) IBOutlet UITextField *songNameField;

@property (weak, nonatomic) IBOutlet UITextField *artistNameField;

@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;



@end

@implementation FAFNewSongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateViews];
}

-(void)updateViews
{
    NSString *name = [[self song] songName];
    NSString *artist = [[self song] artist];
    NSString *rating = [NSString stringWithFormat:@"%ld",(long)[[self song] rating]];
    NSString *lyrics = [[self song] lyrics];
    
    if (name && artist && rating && lyrics){
        
        [[self songNameField] setText: name];
        [[self artistNameField] setText:artist];
        [[self lyricsTextView] setText:lyrics];
        [[self ratingLabel] setText:rating];
    } else {
        return;
    }

    
}

- (IBAction)changeRating:(id)sender {
    
    double rating = [[self ratingStepper] value];
    
    NSNumber *ratingValue = [NSNumber numberWithDouble:rating];
    
    [[self ratingLabel] setText:ratingValue.stringValue];
    
    
}


- (IBAction)createSong:(id)sender {
    
    NSString *name = [[self songNameField] text];
    NSString *artist = [[self artistNameField] text];
    NSString *lyrics = [[self lyricsTextView] text];
    NSInteger rating = (NSInteger)[[self ratingStepper] value];
    
    if (name && artist && lyrics && rating){
        
    [[self songController] createSongWithName:name artist:artist rating:rating lyrics:lyrics];
    
        [[self navigationController] popToRootViewControllerAnimated:YES];
    } else {
        return;
    }
}


- (IBAction)getLyrics:(id)sender {
    
    NSString *name = [[self songNameField] text];
    NSString *artist = [[self artistNameField] text];
    
    [[self songController] fetchLyricsWithName:name artist:artist completion:^(NSString *lyrics, NSError *error) {
        
        if (error){
            NSLog(@"Error obtaining lyric: %@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(),
        ^{
        [[self lyricsTextView] setText:lyrics];
        });
                       
    }];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
