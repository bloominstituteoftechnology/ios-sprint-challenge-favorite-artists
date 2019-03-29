//
//  NELLyricsSearchViewController.m
//  LyricFinder-Objc
//
//  Created by Nelson Gonzalez on 3/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import "NELLyricsSearchViewController.h"

@interface NELLyricsSearchViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;
@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;

@end

@implementation NELLyricsSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)ratingStepperPressed:(id)sender {
}

- (IBAction)searchForLyricsButtonPressed:(id)sender {
}
- (IBAction)saveButtonPressed:(id)sender {
}

@end
