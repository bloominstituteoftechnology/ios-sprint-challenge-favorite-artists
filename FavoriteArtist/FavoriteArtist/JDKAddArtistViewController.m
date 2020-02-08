//
//  JDKAddArtistViewController.m
//  FavoriteArtist
//
//  Created by John Kouris on 2/8/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

#import "JDKAddArtistViewController.h"
#import "JDKArtist+NSJSONSerialization.h"
#import "JDKArtistController.h"
#import "JDKArtist.h"

@interface JDKAddArtistViewController () <UISearchBarDelegate>

@end

@implementation JDKAddArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self.searchBar setDelegate:self];
}

- (void)setupViews
{
    self.artistNameLabel.text = @"";
    self.yearFormedLabel.text = @"";
    self.biographyTextView.text = @"";
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.artistController searchForArtist:searchBar.text completionHandler:^(JDKArtist *artist, NSError *error) {
        if (error) {
            NSLog(@"Error searching for artist: %@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.searchedArtist = artist;
            self.artistNameLabel.text = self.searchedArtist.name;
            self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed %d", self.searchedArtist.yearFormed];
            self.biographyTextView.text = self.searchedArtist.biography;
        });
    }];
}

- (IBAction)saveButtonTapped:(id)sender {
    if (self.searchedArtist) {
        [self saveArtist:_searchedArtist];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        NSLog(@"Could not save");
    }
}

- (void)saveArtist:(JDKArtist *)artist {
    if (artist) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:[artist toDictionary] options:0 error:nil];
        NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        NSURL *url = [[directory URLByAppendingPathComponent:self.searchedArtist.name] URLByAppendingPathExtension:@"json"];
        
        [data writeToURL:url atomically:YES];
    } else {
        NSLog(@"Error saving new artist");
        return;
    }
    return;
}


@end
