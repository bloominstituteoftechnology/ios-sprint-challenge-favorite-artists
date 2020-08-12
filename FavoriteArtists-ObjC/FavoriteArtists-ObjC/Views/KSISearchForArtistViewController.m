//
//  KSISearchForArtistViewController.m
//  FavoriteArtists-ObjC
//
//  Created by Kevin Stewart on 7/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import "KSISearchForArtistViewController.h"
#import "KSIArtistController.h"
#import "KSIArtist.h"

@interface KSISearchForArtistViewController ()

// Outlets
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *artistStartDateLabel;
@property (strong, nonatomic) IBOutlet UITextView *artistBiography;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;

// File Methods
- (void)updateViews;

@end

@implementation KSISearchForArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    [self updateViews];
}

- (void)updateViews
{
    self.artistNameLabel.text = self.ksiArtist.name;
    self.artistStartDateLabel.text = [NSString stringWithFormat:@"Formed in %i", (int)self.ksiArtist.yearArtistFormed];
    self.artistBiography.text = self.ksiArtist.biography;
}

- (IBAction)saveButtonTapped:(id)sender
{
    if (!_ksiArtist) {
        NSLog(@"Artist is nil");
        return;
    }
    [self.ksiArtistController addArtist:self.ksiArtist];
    [self.navigationController popToRootViewControllerAnimated:true];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchTerm = searchBar.text;
    [self.ksiArtistController searchForArtists:searchTerm
                                    completion:^(KSIArtist *artist, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.ksiArtist = artist;
            [self updateViews];
        });
    }];
}


@end
