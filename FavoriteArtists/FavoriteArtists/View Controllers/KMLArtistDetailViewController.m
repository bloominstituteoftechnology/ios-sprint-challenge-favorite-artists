//
//  KMLArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Keri Levesque on 4/17/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

#import "KMLArtistDetailViewController.h"
#import "KMLArtist.h"

@interface KMLArtistDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *formedYear;
@property (strong, nonatomic) IBOutlet UITextView *biography;

- (void)updateViews;

@end

@implementation KMLArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews {
    if (self.artist) {
        self.title = self.artist.name;
        self.formedYear.text = [NSString stringWithFormat:@"Formed in: %@", [self.artist formedYearString]];
        self.biography.text = self.artist.biography;
    }
}

@end
