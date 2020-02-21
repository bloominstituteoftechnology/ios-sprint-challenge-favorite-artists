//
//  ArtistDetailViewController.m
//  FavoriteArtists(iOS12)
//
//  Created by brian vilchez on 2/21/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "BFVArtistController.h"
#import "BFVArtist.h"
@interface ArtistDetailViewController ()

@end

@implementation ArtistDetailViewController


//MARK: - initializers / lifecycles
- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _artistController = [[BFVArtistController alloc]init];
        _artist = [[BFVArtist alloc]init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        _artistController = [[BFVArtistController alloc]init];
        _artist = [[BFVArtist alloc]init];
    }
    return self;
}

- (void)updateViews {
    if ([self artist]) {
       // self.bandNameLabel.text = self.artist.bandName;
       // self.yearFormedLabel.text = self.artist.yearFormed;
       // self.biographyLabel.text = self.artist.biography;
    }
}
@end
