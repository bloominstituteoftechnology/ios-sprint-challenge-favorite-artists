//
//  SDJDetailVC.m
//  FavoriteArtists
//
//  Created by Shawn James on 6/12/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

#import "SDJDetailVC.h"
#import "SDJArtistClient.h"
#import "SDJArtist+JSONSerialization.h"
#import "SDJArtist.h"

@interface SDJDetailVC ()<UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormed;
@property (strong, nonatomic) IBOutlet UITextView *biographyTextView;

@property (nonatomic) SDJArtist *artistSearch;
@property (nonatomic) BOOL artistWasFound;

@end

@implementation SDJDetailVC
- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.artist != nil) {
        self.artistWasFound = YES;
    } else {
        self.artistWasFound = NO;
        [self updateViews];
    }
}

- (void)updateViews {
    // artist
    if (self.artistWasFound == YES) {
        self.title = self.artist.artistName;
        self.artistLabel.text = self.artist.artistName;
        // year
        if (self.artist.yearFormed == 0) {
            self.yearFormed.text = @"No Results";
        } else {
            self.yearFormed.text = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
        }
        // bio
        self.biographyTextView.text = self.artist.artistBiography;
    } else {
        // artist
        self.artistLabel.text = self.artistSearch.artistName;
        // year
        if (self.artistSearch.yearFormed == 0) {
            self.yearFormed.text = @"No Results";
        } else {
            self.yearFormed.text = [NSString stringWithFormat:@"Formed in %d", self.artistSearch.yearFormed];
        }
        // bio
        self.biographyTextView.text = self.artistSearch.artistBiography;
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.artistClient fetchArtistUsingSearchTerm:searchBar.text completion:^(SDJArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist");
        }
        NSLog(@"Fetched artist: %@", artist);
        self.artistSearch = artist;
        
        dispatch_async(dispatch_get_main_queue(), ^ {
            [self updateViews];
        });
    }];
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    if (self.artistSearch == nil) {
        return;
    }
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:[self.artistSearch toDictionary] options:0 error:nil];
    NSURL *directory = [[NSFileManager defaultManager] URLForDirectory: NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    NSURL *url = [[directory URLByAppendingPathComponent:self.artistSearch.artistName] URLByAppendingPathExtension:@"json"];
    
    NSLog(@"Directory: %@", directory);
    NSLog(@"UR: %@", url);
    
    [data writeToURL:url atomically:YES];
    
    [self.navigationController popToRootViewControllerAnimated:true];
}

@end
