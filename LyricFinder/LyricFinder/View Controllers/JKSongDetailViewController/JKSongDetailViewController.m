//
//  JKSongDetailViewController.m
//  LyricFinder
//
//  Created by TuneUp Shop  on 3/1/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import "JKSongDetailViewController.h"

@interface JKSongDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ratingValueLabel;

@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;

@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;

@property (weak, nonatomic) IBOutlet UITextField *artistNameTextField;

@property (weak, nonatomic) IBOutlet UIButton *searchForLyricsButton;

@property (weak, nonatomic) IBOutlet UITextView *songLyricsTextView;

extern double stepperValue;

- (IBAction)valueChanged:(UIStepper *)sender;

@end

@implementation JKSongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)valueChanged:(UIStepper *)sender {
    double value = [sender value];
    stepperValue = value;
    
    [_ratingValueLabel setText:[NSString stringWithFormat:@"%d", (int)value]];
}

@end
