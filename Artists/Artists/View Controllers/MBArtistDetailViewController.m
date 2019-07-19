//
//  MBArtistDetailViewController.m
//  Artists
//
//  Created by Mitchell Budge on 7/19/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "MBArtistDetailViewController.h"

@interface MBArtistDetailViewController ()

@end

@implementation MBArtistDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchBar.delegate = self;
    if (_artist) {
        //self.searchBar.isHidden;
        self.title = _artist.artist;
    } else {
        _artistLabel.text = @"";
        _yearLabel.text = @"";
        _bioTextView.text = @"";
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_artistController getArtist:searchBar.text completionBlock:^(MBArtist *artist, NSError *error) {
        if (error) {
            NSLog(@"Error getting artist info: %@", error);
            return;
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.artistLabel.text = self.artist.artist;
                self.yearLabel.text = [NSString stringWithFormat:@"Formed in %i", (int)self.artist.year];
                self.bioTextView.text = self.artist.bio;
            });
        }
    }];
}

- (IBAction)saveButtonPressed:(id)sender
{
    if (_artist) {
       [_artistController createArtist:_artist];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
