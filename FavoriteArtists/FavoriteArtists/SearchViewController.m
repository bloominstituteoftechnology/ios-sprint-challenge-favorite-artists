//
//  SearchViewController.m
//  FavoriteArtists
//
//  Created by Matthew Martindale on 8/2/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

#import "SearchViewController.h"
#import "Artist.h"
#import "ArtistController.h"
#import "FetchArtist.h"

@interface SearchViewController () <UISearchBarDelegate>

@property (nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (nonatomic) IBOutlet UITextView *biographyLabel;
@property (nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property FetchArtist *fetchArtist;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    self.fetchArtist = [[FetchArtist alloc] init];
    [self updateViews];
}

-(void) updateViews
{
    if (self.artist == nil) {
        self.nameLabel.text = @"No artist found";
    } else {
        
        self.nameLabel.text = self.artist.name;
        NSString *yearFormed = [NSString stringWithFormat:@"%d", self.artist.yearFormed];
        self.yearFormedLabel.text = yearFormed;
        self.biographyLabel.text = self.artist.biography;
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *nameSearched = searchBar.text;
    
    if ([nameSearched isEqualToString:@""]) return;
    
    [self.fetchArtist fetchArtistWithSearchedName:nameSearched completionHandler:^(NSArray *artists, NSError *error) {
        
        self.artist = [artists firstObject];
        [self updateViews];
    }];
}

- (IBAction)saveButtonTapped:(id)sender {
    if (self.artist == nil) return;
    
    [self.artistController addArtist:self.artist];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
