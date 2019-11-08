//
//  CDBFavArtistDetailViewController.m
//  FavoriteArtist
//
//  Created by Ciara Beitel on 11/8/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

#import "CDBFavArtistDetailViewController.h"

@interface CDBFavArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioLabel;

@end

@implementation CDBFavArtistDetailViewController

- (void)setFavArtist:(CDBFavArtist *)favArtist {
    if (favArtist != _favArtist) {
        _favArtist = favArtist;
        [self updateViews];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews {
    self.title = self.favArtist.name;
    self.nameLabel.text = self.favArtist.name;
    self.yearLabel.text = self.favArtist.year;
    self.bioLabel.text = self.favArtist.biography;
}

@end
