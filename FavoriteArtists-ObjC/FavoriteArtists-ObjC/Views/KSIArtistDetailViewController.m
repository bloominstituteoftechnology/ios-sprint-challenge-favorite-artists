//
//  KSIArtistDetailViewController.m
//  FavoriteArtists-ObjC
//
//  Created by Kevin Stewart on 7/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import "KSIArtistDetailViewController.h"
#import "KSIArtistController.h"
#import "KSIArtist.h"

@interface KSIArtistDetailViewController ()

// Outlets
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *artistStartDateLabel;
@property (strong, nonatomic) IBOutlet UITextView *artistBiographyLabel;


@end

@implementation KSIArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews
{
    self.title = [NSString localizedStringWithFormat:@"%@", self.ksiArtist.name];
    self.artistNameLabel.text = self.ksiArtist.name;
    self.artistStartDateLabel.text = [NSString localizedStringWithFormat:@"Formed in %.0f", self.ksiArtist.yearArtistFormed];
    self.artistBiographyLabel.text = self.ksiArtist.biography;
}

@end
