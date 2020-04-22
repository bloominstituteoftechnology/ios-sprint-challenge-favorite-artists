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
#import "FavoriteArtistsViewController.h"

@interface SearchArtistsViewController ()

// Properties
@property (nonatomic) NSString *artistName;
@property (nonatomic) int yearFounded;
@property (nonatomic) NSString *artistBio;

@property (nonatomic) Artist *artist;

@property (nonatomic) BOOL isTyping;

// IBOutlets
@property (nonatomic) IBOutlet UILabel *artistNameLabel;
@property (nonatomic) IBOutlet UILabel *yearFoundedLabel;
@property (nonatomic) IBOutlet UITextView *artistBioTextView;
@property (nonatomic) IBOutlet UISearchBar *artistSearchBar;
@property (nonatomic) IBOutlet UIBarButtonItem *saveButton;

// Private Methods
- (void)saveNewFavoriteArtist;

@end


@implementation SearchArtistsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.artistDetail) {
        self.artistNameLabel.text = @"";
        self.yearFoundedLabel.text = @"";
        self.artistBioTextView.text = @"";
    } else {
        self.artistNameLabel.text = _artistDetail.artistName;
        self.yearFoundedLabel.text = [NSString stringWithFormat:@"%d", _artistDetail.yearFounded];
        self.artistBioTextView.text = _artistDetail.artistBio;
        [self.artistSearchBar setHidden:YES];
        self.saveButton.tintColor = UIColor.clearColor;
    }
    
    
    
   
    
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
    if (_artist) {
        [self.artistFetcher.allArtists addObject:_artist];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

//- (void)searchForArtistWithName:(NSString *)artistName
//{
//
//}


// MARK: - IBActions

- (IBAction)saveButtonTapped:(id)sender
{
    [self saveNewFavoriteArtist];
}

// MARK: - UISearchBar

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (!self.isTyping) {
//        ArtistFetcher *fetcher = [[ArtistFetcher alloc] init];
        
        
        [_artistFetcher fetchArtist:searchText WithCompletionHandler:^(Artist * _Nullable artist, NSError * _Nullable error) {
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
