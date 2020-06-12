//
//  MJPArtistsViewController.m
//  Artists
//
//  Created by Mark Poggi on 6/12/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

#import "MJPArtistsViewController.h"

@interface MJPArtistsViewController ()

@end

@implementation MJPArtistsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    if (_artist) {
        self.searchBar.isHidden;
        self.artistLabel.text = _artist.strArtist;
        self.yearLabel.text = [NSString stringWithFormat:@"Formed in %i",_artist.yearFormed];
        self.bioTextView.text = _artist.strBiographyEN;
        } else if (!_artist) {
            self.artistLabel.text = @"";
            self.yearLabel.text = @"";
            self.bioTextView.text = @"";
        }
    }

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_artistController fetchArtist:searchBar.text completionBlock:^(MJPArtist * _Nullable artist, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error getting artist info: %@", error);
            return;
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.searchedArtist = artist;
                self.artistLabel.text = self.searchedArtist.strArtist;
                self.yearLabel.text = [NSString stringWithFormat:@"Formed in %i", (int)self.searchedArtist.yearFormed];
                self.bioTextView.text = self.searchedArtist.strBiographyEN;
            });
        }
    }];
}

- (IBAction)saveButtonPressed:(id)sender
{
    if (_searchedArtist) {
       [_artistController createArtist:_searchedArtist];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
