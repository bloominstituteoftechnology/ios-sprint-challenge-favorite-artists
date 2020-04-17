//
//  ArtistDetailViewController.m
//  Art
//
//  Created by Nick Nguyen on 4/17/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "NPTLog.h"
#import "NPTArtist.h"
#import "ArtistFetcher.h"

@interface ArtistDetailViewController ()


@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *biographyTextView;

@property (nonatomic) ArtistFetcher *artistFetcher;

@end

@implementation ArtistDetailViewController

- (ArtistFetcher *)artistFetcher {
    if (!_artistFetcher) {
        _artistFetcher = [[ArtistFetcher alloc] init];
    }
    return _artistFetcher;
}


- (IBAction)savePressed:(UIBarButtonItem *)sender {
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar becomeFirstResponder];
    [self.searchBar setShowsScopeBar:YES];
    _searchBar.delegate = self;

}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.artistFetcher fetchArtistWithSearchTerm:searchBar.text completionBlock:^(NPTArtist * _Nullable artist, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(),^{
            if (artist) {
                self.artistNameLabel.text = artist.name;
                self.biographyTextView.text = artist.biography;
                self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
            }
        });
        NSLog(artist.name);
    }];
}

@end
