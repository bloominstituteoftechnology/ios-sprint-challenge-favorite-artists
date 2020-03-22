//
//  MBMArtistSearchViewController.m
//  FavoriteArtists
//
//  Created by Michael on 3/20/20.
//  Copyright © 2020 Michael. All rights reserved.
//

#import "MBMArtistSearchViewController.h"
#import "MBMArtistResults.h"
#import "MBMArtist.h"
#import "ArtistFetcher.h"

@interface MBMArtistSearchViewController () <UISearchBarDelegate>

// MARK: - Properties



// MARK: - IBOutlets

@property (strong, nonatomic) IBOutlet UISearchBar *artistSearchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *artistBiographyTextView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;


@end

@implementation MBMArtistSearchViewController

@synthesize artistFetcher;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.artistSearchBar.delegate = self;
    [self updateViews];
}



// MARK: - IBActions
- (IBAction)saveTapped:(id)sender {
    if (self.artist == nil) {
        return;
    }
    
    [self.artistFetcher.artistsArray addObject:self.artist];
    [self.artistFetcher saveToPersistentStore];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [self.artistFetcher searchArtistsWithArtistName:self.artistSearchBar.text completionBlock:^(NSArray<MBMArtist *> * _Nullable artists, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (artists.firstObject == nil) {
            } else {
                
            self.artistNameLabel.text = artists.firstObject.artistName;
            NSLog(@"Artist Name: %@", artists.firstObject.artistName);
                if (!artists.firstObject.yearFormed) {
                self.yearFormedLabel.text = @"Formed in: N/A";
            } else {
                self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in: %d", artists.firstObject.yearFormed];
            }
            self.artistBiographyTextView.text = artists.firstObject.artistBiography;
            self.artist = artists.firstObject;
            }
        });
    }];
}


-(void)updateViews {
    if (self.persistedArtist != nil) {
        self.artistNameLabel.text = self.persistedArtist.artistName;
        self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in: %d", self.persistedArtist.yearFormed];
        self.artistBiographyTextView.text = self.persistedArtist.artistBiography;
        self.navigationItem.rightBarButtonItem = nil;
    }
}

@end
