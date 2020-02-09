//
//  ArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Joel Groomer on 2/8/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "Artist.h"
#import "ArtistController.h"

@interface ArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnSave;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *lblArtistName;
@property (weak, nonatomic) IBOutlet UILabel *lblFormedIn;
@property (weak, nonatomic) IBOutlet UITextView *txtvBio;

- (IBAction)saveTapped:(id)sender;

@end

@implementation ArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    [self.searchBar setDelegate:self];
}

- (void)updateViews
{
    if (self.viewLoaded) {
        if (self.artist) {
            if ([self.artistController.artists containsObject:self.artist]) {
                self.btnSave.enabled = NO;
            } else {
                self.btnSave.enabled = YES;
            }
            self.title = self.artist.name;
            self.searchBar.hidden = YES;
            self.lblArtistName.text = self.artist.name;
            self.lblFormedIn.text = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
            self.txtvBio.text = self.artist.bio;
        } else {
            self.btnSave.enabled = NO;
            self.title = @"Add New Artist";
            self.searchBar.hidden = NO;
            self.lblArtistName.text = @"";
            self.lblFormedIn.text = @"";
            self.txtvBio.text = @"";
        }
    }
}

- (IBAction)saveTapped:(id)sender {
    if (self.artistController && self.artist) {
        [self.artistController addArtist:self.artist];
        [self.navigationController popViewControllerAnimated:true];
    }
}

#pragma mark - Accessors

- (void)setArtist:(Artist *)artist
{
    _artist = artist;
    [self updateViews];
}

#pragma mark - Search Bar Delegate Functions

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    self.txtvBio.text = @"Searching";
    [self.artistController searchForArtistNamed:searchBar.text completionHandler:^(Artist * foundArtist, NSError *error) {
        if (error) {
            NSLog(@"Returned from search with error: %@", error);
        }
        
        if (foundArtist) {
            NSLog(@"Found %@", foundArtist);
            self.artist = foundArtist;
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.txtvBio.text = @"Not found";
            });
        }
    }];
}

@end
