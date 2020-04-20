//
//  ArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Chris Gonzales on 4/17/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

#import "ArtistDetailViewController.h"

@interface ArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *foundedLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistInfoLabel;

@property (nonatomic) CDGArtistController *artistController;
@property (nonatomic) CDGArtist *artist;


@end

@implementation ArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    
    if (self.artist) {
        [self.searchBar setHidden:YES];
        self.navigationItem.rightBarButtonItem = nil;
    } else {
        [self.searchBar setHidden:NO];
    }
}

- (IBAction)saveTapped:(UIBarButtonItem *)sender {
    NSData *data = [NSJSONSerialization dataWithJSONObject: [self.artist toDictionary] options:0 error:nil];
    NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    NSURL *url = [[directory URLByAppendingPathComponent:self.artist.artist] URLByAppendingPathExtension: @"json"];
    
    [data writeToURL:url atomically:YES];

    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)updateViews {
    if (self.artist != nil) {
        self.artistNameLabel.text = self.artist.artist;
        self.foundedLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.artist.formedYear];
        self.artistInfoLabel.text = self.artist.biography;
    } else {
        self.title = @"Add New Artist";
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *query = searchBar.text;
    
    [self.artistController searchForArtist:query completion:^(CDGArtist *artist, NSError *error) {
        if (error){
            NSLog(@"Error searching artist");
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.artist = artist;
                self.artistNameLabel.text = artist.artist;
                self.foundedLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)artist.formedYear];
                self.artistInfoLabel.text = artist.biography;
            });
            NSLog(@"Search result: %@", artist);
        }
    }];
    
    [self.searchBar endEditing:YES];
}

@end
