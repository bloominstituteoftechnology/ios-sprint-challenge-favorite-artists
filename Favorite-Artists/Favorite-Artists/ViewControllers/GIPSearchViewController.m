//
//  GIPSearchViewController.m
//  Favorite-Artists
//
//  Created by Gi Pyo Kim on 12/13/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

#import "GIPSearchViewController.h"
#import "GIPArtistController.h"
#import "GIPArtist.h"

@interface GIPSearchViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyLabel;
- (IBAction)saveArtist:(id)sender;

@property GIPArtist *artist;

- (void)updateViews;


@end

@implementation GIPSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.searchBar setDelegate:self];
    [self updateViews];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.controller searchArtistWithName:searchBar.text completion:^(GIPArtist *artist, NSError *error) {
        if (error) {
            NSLog(@"Search Error: %@", error);
            self.artist = Nil;
            return;
        }
        
        self.artist = artist;
        [self updateViews];
    }];
    [self.searchBar resignFirstResponder];
}

- (void)updateViews {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.artist != Nil) {
            self.nameLabel.text = self.artist.name;
            self.yearLabel.text = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
            self.biographyLabel.text = self.artist.biography;
        } else {
            self.nameLabel.text = @"";
            self.yearLabel.text = @"";
            self.biographyLabel.text = @"";
        }
    });
}

- (IBAction)saveArtist:(id)sender {
    if (self.artist != Nil) {
        [self.controller addArtist:self.artist];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        NSLog(@"Error saving artist: %@", self.searchBar.text);
    }
}
@end
