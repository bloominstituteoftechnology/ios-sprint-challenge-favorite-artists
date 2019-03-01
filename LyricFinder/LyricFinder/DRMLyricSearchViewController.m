//
//  DRMLyricSearchViewController.m
//  LyricFinder
//
//  Created by Dillon McElhinney on 3/1/19.
//  Copyright © 2019 Dillon McElhinney. All rights reserved.
//

#import "DRMLyricSearchViewController.h"

@interface DRMLyricSearchViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextField *trackTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricTextView;

- (IBAction)changeRating:(UIStepper *)sender;
- (IBAction)searchForLyrics:(id)sender;
- (IBAction)saveLyrics:(id)sender;


@end

@implementation DRMLyricSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)changeRating:(UIStepper *)sender {
}

- (IBAction)searchForLyrics:(id)sender {
}

- (IBAction)saveLyrics:(id)sender {
}
@end
