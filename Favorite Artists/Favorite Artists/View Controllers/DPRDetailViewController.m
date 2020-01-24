//
//  DPRDetailViewController.m
//  Favorite Artists
//
//  Created by Dennis Rudolph on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "DPRDetailViewController.h"

@interface DPRDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;
- (void)updateViews;

@end

@implementation DPRDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews {
    if (self.artist) {
        self.nameLabel.text = self.artist.name;
        NSInteger valid = self.artist.yearFormed;
        if (valid == 0) {
            self.yearLabel.text = @"Formed in: ?";
        } else {
            self.yearLabel.text = [NSString stringWithFormat:@"Formed in %li", (long)self.artist.yearFormed];
        }
        self.bioTextView.text = self.artist.bio;
    }
}

@end
