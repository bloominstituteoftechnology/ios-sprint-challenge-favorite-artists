//
//  ArtistDetailViewController.m
//  Favorite Artists
//
//  Created by Vincent Hoang on 7/17/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "Artist.h"
#import "ArtistController.h"
#import "Artist+NSJSONSerialization.h"

@interface ArtistDetailViewController () <UISearchBarDelegate>

@property (nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic) IBOutlet UILabel *formedLabel;
@property (nonatomic) IBOutlet UILabel *bioLabel;

@property (nonatomic, strong) ArtistController *controller;

@end

@implementation ArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
    self.controller = [ArtistController alloc];
    
    if (self.artist != nil) {
        self.searchBar.hidden = YES;
        [self updateViews];
    }
}

// MARK: - IBAction
- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender {
    NSLog(@"Save button pressed");
    [self save];
}

// MARK: - Persistence
- (void) save {
    if (self.artist) {
        [self.controller save:self.artist];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

// MARK: - Utility

- (void)updateViews {
    self.title = self.artist.name;
    
    self.nameLabel.text = self.artist.name;
    self.formedLabel.text = [NSString stringWithFormat:@"Formed in %d", self.artist.formed];
    self.bioLabel.text = self.artist.bio;
}

// MARK: - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"search button pressed");
    [self search];
}

//- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
//    [self search];
//}

- (void)search {

    NSString *query = self.searchBar.text;
    
    if (query.length > 0) {
    
        [self.controller fetchArtistsByName:query
                                 completion:^(Artist * _Nullable artist, NSError * _Nullable error) {
            if (error) {
                NSLog(@"Error getting artists: %@", error);
                return;
            }
            
            self.artist = artist;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateViews];
            });
        }];
        
    }
    
    [self.searchBar resignFirstResponder];
}

@end
