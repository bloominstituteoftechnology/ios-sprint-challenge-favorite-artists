//
//  HHArtistDetailViewController.m
//  Artist
//
//  Created by Hayden Hastings on 7/19/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

#import "HHArtistDetailViewController.h"
#import "HHArtist.h"

@interface HHArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;

@end

@implementation HHArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews {
    [self.navigationItem setTitle:self.artist.name];
    _nameLabel.text = _artist.name;
    NSString *yearFormed = [NSString stringWithFormat:@"%d", _artist.yearFormed];
    _yearLabel.text = yearFormed;
    _biographyTextView.text = _artist.biography;
}

@end
