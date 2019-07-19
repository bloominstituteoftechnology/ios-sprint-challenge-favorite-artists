//
//  KTMArtistDetailViewController.m
//  ObjC-FavoriteArtist
//
//  Created by Kobe McKee on 7/19/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

#import "KTMArtistDetailViewController.h"
#import "KTMArtist.h"

@interface KTMArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;

@end

@implementation KTMArtistDetailViewController


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
