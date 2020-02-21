//
//  RWDetailViewController.m
//  Favorite Artists
//
//  Created by Rick Wolter on 2/21/20.
//  Copyright © 2020 Devshop7. All rights reserved.
//

#import "RWDetailViewController.h"

@interface RWDetailViewController ()



@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;


- (void)updateViews;


@end

@implementation RWDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
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
