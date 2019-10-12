//
//  MJRArtistDetailViewController.m
//  FavoriteArtists-ObjC
//
//  Created by Marlon Raskin on 10/11/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

#import "MJRArtistDetailViewController.h"
#import "MJRArtist+MJRNSJSONSerialization.h"
#import "MJRArtistController.h"
#import "MJRArtist.h"

@interface MJRArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;


@end

@implementation MJRArtistDetailViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        _artistController = [[MJRArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    if (self.artist == nil) {
        self.artistNameLabel.text = @"";
        self.yearFormedLabel.text = @"";
    } else {
        self.title = self.artist.artistName;
        self.artistNameLabel.text = self.artist.artistName;
        self.bioTextView.text = self.artist.bio;
        self.yearFormedLabel.text = [NSString stringWithFormat:@"Year formed: %d", self.artist.yearFormed];
        self.searchBar.hidden = YES;
    }
}

- (void)saveArtist:(MJRArtist *)fetchedArtist {
    if (fetchedArtist) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:[fetchedArtist artistData] options:0 error:nil];
        NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        NSURL *url = [[directory URLByAppendingPathComponent:self.artist.artistName] URLByAppendingPathExtension:@"json"];

        [data writeToURL:url atomically:YES];
    } else {
        NSLog(@"Error saving new artist");
        return;
    }
    return;
}

- (IBAction)saveTapped:(UIBarButtonItem *)sender {
    if (self.artist) {
        [self saveArtist:self.artist];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        NSLog(@"No artist selected or invalid artist");
    }
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [self.searchBar setShowsCancelButton:YES animated:YES];
//    [self.navigationController setHidesBarsWhenKeyboardAppears:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [self.searchBar setShowsCancelButton:NO animated:YES];
    if (self.searchBar.showsCancelButton == NO) {
//        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *artistSearchQuery = self.searchBar.text;
    [_artistController searchArtistWithName:artistSearchQuery completion:^(MJRArtist *artist, NSError *error) {
        if (error) {
            NSLog(@"Error fetching artist data with searchQuery: %@:", error);
            return;
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            if  ([artist artistName]) {
                self.artist = artist;
                self.artistNameLabel.text = artist.artistName;

                NSLog(@"The artist.yearFormed value is: %d", artist.yearFormed);
                if (artist.yearFormed == 0) {
                    [[self yearFormedLabel] setText:@"Unavailable"];
                } else {
                    NSString *yearFormedStr = [NSString stringWithFormat:@"Year formed: %d", artist.yearFormed];
                    self.yearFormedLabel.text = yearFormedStr;
                }
                self.bioTextView.text = artist.bio;
            } else {
                self.artistNameLabel.text = @"Artist not found";
            }
        });
    }];

    [self.searchBar resignFirstResponder];
}

@end
