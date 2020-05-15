//
//  AddViewController.m
//  Favorite Artists
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import "AddViewController.h"
#import "MTGArtist.h"
#import "MTGArtistFetcher.h"

@interface AddViewController () <UISearchBarDelegate> {
    MTGArtist *artist;
}

@property (nonatomic) MTGArtistFetcher *fetcher;

// MARK: - Outlets

@property (strong, nonatomic) IBOutlet UILabel *artistLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;
@property (strong, nonatomic) IBOutlet UITextView *biographyTextView;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation AddViewController

//- (void)setArtist:(MTGArtist *)artist {
//    self.artist = artist;
//    [self updateViews];
//}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.searchBar.delegate = self;

    [self updateViews];
}

- (void)updateViews {

    if (artist == nil) {
        _artistLabel.text = @"";
        _yearLabel.text = @"";
        _biographyTextView.text = @"";
    } else {
        _artistLabel.text = artist.artist;
        if (artist.formedYear == -1) {
            _yearLabel.text = @"Formed: N/A";
        } else {
            _yearLabel.text = [NSString stringWithFormat:@"Formed in %0d", artist.formedYear];
        }
        _biographyTextView.text = artist.biography;
    }
}

// MARK: - IBActions

- (IBAction)saveButton:(UIBarButtonItem *)sender {
    // TODO: Save artist

    [self.navigationController popViewControllerAnimated:YES];
}

// Properties

// Lazy property
- (MTGArtistFetcher *)fetcher {
    if (!_fetcher) {
        _fetcher = [[MTGArtistFetcher alloc] init];
    }
    return _fetcher;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];

    [self performSearch:searchBar.text];
}

-(void)performSearch:(NSString *)searchTerm {
    [self.fetcher fetchArtistByName:searchTerm completionBlock:^(MTGArtist * _Nullable foundArtist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Artist Fetching Error: %@", error);
            return;
        }

        NSLog(@"Arstist: %@", foundArtist);

        dispatch_async(dispatch_get_main_queue(), ^{
            self->artist = foundArtist;
            [self updateViews];
        });
    }];
}

@end
