//
//  SLBLyricDetailViewController.m
//  Lyric Finder
//
//  Created by Scott Bennett on 11/16/18.
//  Copyright © 2018 Scott Bennett. All rights reserved.
//

#import "SLBLyricDetailViewController.h"
#import "SLBSong.h"

@interface SLBLyricDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation SLBLyricDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)ratingStepper:(id)sender {
   
    self.ratingLabel.text = [NSString stringWithFormat:@"Rating: %0.0f", self.stepper.value];
        
}

- (IBAction)saveButton:(id)sender {
    NSLog(@"Saved");
}

@end
