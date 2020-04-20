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
#import "Artist+NSJSONSerialization.h"

@interface SearchArtistsViewController ()

// Properties
@property (nonatomic) Artist *artist;
@property (nonatomic) NSString *artistName;
@property (nonatomic) int yearFounded;
@property (nonatomic) NSString *artistBio;

@property (nonatomic) BOOL isTyping;

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
    
    self.artistNameLabel.text = @"";
    self.yearFoundedLabel.text = @"";
    self.artistBioTextView.text = @"";
    
   
    
//    ArtistFetcher *fetcher = [[ArtistFetcher alloc] init];
//
//    [fetcher fetchArtist:@"macklemore" WithCompletionHandler:^(Artist * _Nullable artist, NSError * _Nullable error) {
//        if (artist) {
//            self.artist = artist;
//            self.artistNameLabel.text = artist.artistName;
//            self.artistBioTextView.text = artist.artistBio;
//            if (artist.yearFounded != 0) {
//                NSString *yearFoundedText = [NSString stringWithFormat:@"%d", artist.yearFounded];
//                self.yearFoundedLabel.text = yearFoundedText;
//            } else {
//                self.yearFoundedLabel.text = @"";
//            }
//        }
//    }];
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

// MARK: - UISearchBar

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (!self.isTyping) {
        ArtistFetcher *fetcher = [[ArtistFetcher alloc] init];
        
        
        [fetcher fetchArtist:searchText WithCompletionHandler:^(Artist * _Nullable artist, NSError * _Nullable error) {
            if (artist) {
                self.artist = artist;
                self.artistNameLabel.text = artist.artistName;
                self.artistBioTextView.text = artist.artistBio;
                if (artist.yearFounded != 0) {
                    NSString *yearFoundedText = [NSString stringWithFormat:@"%d", artist.yearFounded];
                    self.yearFoundedLabel.text = yearFoundedText;
                } else {
                    self.yearFoundedLabel.text = @"";
                }
            }
        }];
    }
}

//- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
//{
//    self.isTyping = YES;
//}
//
//- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
//{
//    self.isTyping = NO;
//}
//
////- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
////{
////    return self.isTyping = YES;
////}
////
////- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
////{
////    return YES;
////}
//
//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
//{
//    [self searchForArtistWithName:]
//}

@end
