//
//  JDKShowArtistDetailsViewController.m
//  FavoriteArtist
//
//  Created by John Kouris on 2/8/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

#import "JDKShowArtistDetailsViewController.h"
#import "JDKArtist.h"

@interface JDKShowArtistDetailsViewController ()

@end

@implementation JDKShowArtistDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews {
    [self.navigationItem setTitle:self.artist.name];
    
    self.artistNameLabel.text = self.artist.name;
    
    NSString *yearFormed = [NSString stringWithFormat:@"Formed %d", self.artist.yearFormed];
    self.yearFormedLabel.text = yearFormed;
    
    self.biographyTextView.text = self.artist.biography;
}


@end
