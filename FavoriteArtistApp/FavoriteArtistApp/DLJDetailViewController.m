//
//  DLJDetailViewController.m
//  FavoriteArtistApp
//
//  Created by Diante Lewis-Jolley on 7/19/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

#import "DLJDetailViewController.h"

@interface DLJDetailViewController ()

@end

@implementation DLJDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

-(void)updateViews {

    self.artistNameLabel.text = self.artist.name;
    self.textView.text = self.artist.bio;
    NSString *yearFormedString = [NSString stringWithFormat:@"Formed in %@", self.artist.yearFormed];

    self.formedLabel.text = yearFormedString;

    [self.navigationItem setTitle:self.artist.name];


}

@end
