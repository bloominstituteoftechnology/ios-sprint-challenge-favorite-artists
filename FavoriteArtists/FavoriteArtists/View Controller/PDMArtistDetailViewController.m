//
//  PDMArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Patrick Millet on 6/12/20.
//  Copyright © 2020 PatrickMillet79. All rights reserved.
//

#import "PDMArtistDetailViewController.h"
#import "PDMArtist.h"
#import "PDMArtistController.h"
#import "PDMArtist+JSONSerialization.h"

@interface PDMArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UILabel *biographyLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation PDMArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    self.searchBar.delegate = self;
}

- (IBAction)saveArtist:(id)sender {
    if (self.artist) {
        [self.artistController addArtist:self.artist];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        NSLog(@"No Artist to Save - Add some UI feature to disable button if search field is empty. Returns user to table view to try agian.");
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)updateViews
{
    if (self.artist) {
        [self displayArtist];
        [self.searchBar removeFromSuperview];
        self.navigationItem.rightBarButtonItem = nil;
    } else {
        self.title = @"Add New Artist";
        self.artistNameLabel.text = @"";
        self.yearFormedLabel.text = @"";
        self.biographyLabel.text = @"";
    }
}

- (void)displayArtist {
    self.title = self.artist.name;
    
    self.artistNameLabel.text = self.artist.name;
    if (self.artist.yearFormed == PDM_Artist_UnknownYear) {
        self.yearFormedLabel.text = @"Unknown year formed";
    } else {
        self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %lu", self.artist.yearFormed];
    }
    
    self.biographyLabel.text = self.artist.biography;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.artistController searchForArtistWithName:searchBar.text completion:^(PDMArtist *artist) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.artist = artist;
            
            if (artist) {
                [self displayArtist];
            } else {
                self.artistNameLabel.text = [NSString stringWithFormat:@"No Artists for \"%@\"", searchBar.text];
                self.yearFormedLabel.text = @"Try another search";
                self.biographyLabel.text = @"";
            }
            
        });
    }];
}

@end
