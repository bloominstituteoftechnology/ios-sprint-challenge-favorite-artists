//
//  CCCArtistDetailViewController.m
//  ios-sprint-challenge-favorite-artists
//
//  Created by Jonalynn Masters on 1/24/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import "CCCArtistDetailViewController.h"
#import "CCCArtist.h"

@interface CCCArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;

@end

@implementation CCCArtistDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}


- (void)updateViews {
    [self.navigationItem setTitle:self.artist.name];
    self.nameLabel.text = self.artist.name;
    NSString *year = [NSString stringWithFormat:@"Formed %d", self.artist.yearFormed];
    self.yearLabel.text = year;
    self.biographyTextView.text = self.artist.biography;
}




@end
