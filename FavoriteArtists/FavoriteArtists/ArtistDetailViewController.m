//
//  ArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Karen Rodriguez on 5/15/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "HLOArtistModelController.h"
#import "HLOArtist.h"

@interface ArtistDetailViewController () <UISearchBarDelegate>

// MARK:- Outlets
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;
@property (strong, nonatomic) IBOutlet UITextView *biographyText;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation ArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self clearViews];
    [self setupViews];
}

// MARK:- Methods

- (void)setupViews {
    if (self.artist) {
        [self.searchBar setHidden:true];
        [self.saveButton setEnabled:false];
        [self setTitle:[NSString stringWithFormat:@"%@", self.artist.artistName]];
        self.nameLabel.text = self.artist.artistName;
        self.yearLabel.text = self.artist.yearFormed == 1 ? @"No year data from database." : [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
        self.biographyText.text = self.artist.artistBiography;
    } else {
        self.searchBar.delegate = self;
    }
}

- (void)clearViews {
    self.searchBar.text = @"";
    self.nameLabel.text = @"";
    self.yearLabel.text = @"";
    self.biographyText.text = @"";
}
/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
