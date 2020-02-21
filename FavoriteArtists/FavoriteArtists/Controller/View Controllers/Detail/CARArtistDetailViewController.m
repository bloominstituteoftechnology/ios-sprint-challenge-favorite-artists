//
//  CARArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Chad Rutherford on 2/21/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARArtistDetailViewController.h"

@interface CARArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;

@end

@implementation CARArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews {
    self.title = self.artist.name;
    self.nameLabel.text = self.artist.name;
    if (self.artist.yearFormed == 0) {
        self.yearFormedLabel.text = @"Formed in N/A";
    } else {
        self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
    }
    self.biographyTextView.text = self.artist.biography;
}

@end
