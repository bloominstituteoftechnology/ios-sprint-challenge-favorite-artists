//
//  VDRArtistDetailViewController.m
//  FavArtists
//
//  Created by Victor  on 7/19/19.
//  Copyright © 2019 Victor . All rights reserved.
//

#import "VDRArtistDetailViewController.h"
#import "VDRArtist.h"

@interface VDRArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;

@end

@implementation VDRArtistDetailViewController


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
