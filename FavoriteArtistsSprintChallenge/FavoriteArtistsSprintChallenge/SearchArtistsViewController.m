//
//  SearchArtistsViewController.m
//  FavoriteArtistsSprintChallenge
//
//  Created by Dillon P on 4/19/20.
//  Copyright © 2020 Dillon's Lambda Team. All rights reserved.
//

#import "SearchArtistsViewController.h"
#import "Artist.h"
#import "ArtistFetcher.h"

@interface SearchArtistsViewController ()

// Properties
@property (nonatomic, readonly) Artist *artist;


// IBOutlets
@property (nonatomic) IBOutlet UILabel *artistNameLabel;
@property (nonatomic) IBOutlet UILabel *yearFoundedLabel;
@property (nonatomic) IBOutlet UITextView *artistBioTextView;
@property (nonatomic) IBOutlet UISearchBar *artistSearchBar;

// Private Methods
- (void)saveNewFavoriteArtist;
- (void)searchForArtistWithName:(NSString *)artistName;

@end


@implementation SearchArtistsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _artistNameLabel.text = @"";
    _yearFoundedLabel.text = @"";
    _artistBioTextView.text = @"";
    
    ArtistFetcher *fetcher = [[ArtistFetcher alloc] init];
    
    [fetcher fetchArtist:@"macklemore" WithCompletionHandler:^(Artist * _Nullable artist, NSError * _Nullable error) {
        if (artist) {
            self->_artist = artist;
            self->_artistNameLabel.text = artist.artistName;
            self->_artistBioTextView.text = artist.artistBio;
            if (artist.yearFounded != 0) {
                NSString *yearFoundedText = [NSString stringWithFormat:@"%d", artist.yearFounded];
                self->_yearFoundedLabel.text = yearFoundedText;
            } else {
                self->_yearFoundedLabel.text = @"";
            }
        }
    }];
}

// MARK: - Private Methods

- (void)saveNewFavoriteArtist
{
    
}

- (void)searchForArtistWithName:(NSString *)artistName
{
    
}


// MARK: - IBActions

- (IBAction)saveButtonTapped:(id)sender
{
    [self saveNewFavoriteArtist];
}

@end
