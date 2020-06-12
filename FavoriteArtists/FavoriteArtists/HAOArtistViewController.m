//
//  HAOArtistViewController.m
//  FavoriteArtists
//
//  Created by Hunter Oppel on 6/12/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

#import "HAOArtistViewController.h"
#import "HAOArtistFetcher.h"
#import "HAOArtist.h"

@interface HAOArtistViewController () <UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *artistBiographyTextView;

@property HAOArtistFetcher *artistFetcher;

- (void)setUpViewsWithArtist;
- (void)setUpViewsWithoutArtist;
- (void)updateViews;

@end

@implementation HAOArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.artist) {
        [self setUpViewsWithArtist];
    } else {
        [self setUpViewsWithoutArtist];
    }
}

- (void)setUpViewsWithArtist
{
    self.searchBar.hidden = YES;
    self.navigationItem.rightBarButtonItem = nil;
    
    self.title = self.artist.artistName;
    self.artistNameLabel.text = self.artist.artistName;
    self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
    self.artistBiographyTextView.text = self.artist.artistBiography;
}

- (void)setUpViewsWithoutArtist
{
    self.searchBar.hidden = NO;
    [self.searchBar sizeToFit];
    
    self.title = @"Add New Artist";
    self.artistNameLabel.text = @"";
    self.yearFormedLabel.text = @"";
    self.artistBiographyTextView.text = @"";
    
    self.searchBar.delegate = self;
    self.artistFetcher = [[HAOArtistFetcher alloc] init];
}

- (void)updateViews
{
    self.artistNameLabel.text = self.artist.artistName;
    self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
    self.artistBiographyTextView.text = self.artist.artistBiography;
}

- (IBAction)saveArtist:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(didSaveArtist:)]) {
        [self.delegate didSaveArtist:self.artist];
    }
    
    [self.navigationController popViewControllerAnimated:true];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *artistSearched = self.searchBar.text;
    
    [self.artistFetcher fetchArtistWithName:artistSearched completion:^(HAOArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            return;
        }
        
        self.artist = artist;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateViews];
        });
    }];
}

@end
