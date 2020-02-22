//
//  ArtistDetailViewController.m
//  FavoriteAritists
//
//  Created by brian vilchez on 1/24/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "Artist.h"
@interface ArtistDetailViewController ()

@end

@implementation ArtistDetailViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _artist = [[Artist alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
       if (self) {
           _artist = [[Artist alloc] init];
       }
       return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews {
    self.artistNameLabel.text = _artist.artistName;
    self.biographyLabel.text = _artist.biography;
    self.yearFormedLabel.text = [NSString stringWithFormat:@"year formed in %i", _artist.yearFormed];
}
 
@end
