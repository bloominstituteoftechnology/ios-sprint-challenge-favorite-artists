//
//  NMKArtistDetailViewController.m
//  Favorite Artist ObjC
//
//  Created by Niranjan Kumar on 1/24/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import "NMKArtistDetailViewController.h"
#import "NMKArtist.h"
#import "NMKArtistController.h"
#import "NSJSONSerialization+NMKArtist.h"

@interface NMKArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;

@end

@implementation NMKArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
    [self updateViews];
    
}

- (IBAction)save:(UIBarButtonItem *)sender {
    NMKArtist *artist = [[NMKArtist alloc] initWithArtistName:self.artistLabel.text biography:self.biographyTextView.text yearFormed:self.artist.yearFormed];
    [self.artistController addArtist:artist];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateViews {
    if (self.artist) {
        //    self.title = self.artist.artist;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.artistLabel.text = self.artist.artist;
            self.yearFormedLabel.text =  [NSString stringWithFormat:@"Formed in %i", self.artist.yearFormed];
            self.biographyTextView.text = self.artist.biography;
        });
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchTerm = searchBar.text;
    [_artistController fetchArtist:searchTerm completion:^(NMKArtist *artist, NSError *error) {
        self.artist = artist;
        dispatch_async(dispatch_get_main_queue(), ^{
            if (artist) {
                [self updateViews];
            }
        });
    }];
}

- (void)setArtist:(NMKArtist *)artist{
    if (_artist != artist) {
        _artist = artist;
        [self updateViews];
    }
}


@end
