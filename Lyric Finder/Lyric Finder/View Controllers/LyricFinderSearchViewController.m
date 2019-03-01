//
//  LyricFinderSearchViewController.m
//  Lyric Finder
//
//  Created by Ivan Caldwell on 3/1/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import "LyricFinderSearchViewController.h"
#import "IACLyricController.h"
#import "IACLyric.h"

@interface LyricFinderSearchViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;
@property NSInteger rating;
@end

@implementation LyricFinderSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rating = 0;
    // Do any additional setup after loading the view.
    [self updateViews];
}
- (IBAction)searchButtonTapped:(id)sender {
    // Perform fetch results...
}
- (IBAction)minusButtonTapped:(id)sender {
    self.rating -= 1;
    [self updateViews];
}
- (IBAction)addButtonTapped:(id)sender {
    self.rating += 1;
    [self updateViews];
}
- (IBAction)saveButtonTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateViews{
    
    // Because Objective-C won't let me simply cast an int to a string... :(
    NSString *ratingString = [NSString stringWithFormat:@"Rating: %ld", (long)self.rating];
    [self.ratingLabel setText:ratingString];
    NSLog(@"Hello...%@", self.ratingLabel.text);
    // And I'm being dumb...
}

@end
