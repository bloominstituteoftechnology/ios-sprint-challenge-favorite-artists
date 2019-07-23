//
//  LSIDetailViewController.m
//  FaveArtists
//
//  Created by John Pitts on 7/19/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

#import "LSIDetailViewController.h"
#import "LSIArtist.h"
#import "LSIArtistController.h"


@interface LSIDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *artistSearchBar;

@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFoundedLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;



@end

@implementation LSIDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _artistSearchBar.delegate = self;
    
    [self updateViews];
}

// custom setter for artist (set), similar to didSet
- (void)setArtist:(LSIArtist *)artist {               //i had a mispelling SetAarrsk or something, run again
    if (artist != _artist) {
        _artist = artist;
        [self updateViews];
    }
}

- (void)updateViews {
    
    // if there's no artist in table view, return so user can do first search ASAP, similar to guard-let
   if (!self.isViewLoaded || !self.artist) { return; }

    dispatch_async(dispatch_get_main_queue(), ^{
        self.artistLabel.text = self.artist.strArtist;
        self.yearFoundedLabel.text = [NSString stringWithFormat:@"%@", [NSString stringWithFormat:@"%ld", self.artist.intFormedYear]];
        self.bioTextView.text = self.artist.strBiographyEN;
    });
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

    NSString *searchText = self.artistSearchBar.text;
    
    [_artistController fetchArtistWith:searchText completionBlock:^(LSIArtist * _Nonnull fetchedArtist, NSError * _Nonnull error) {
        if (fetchedArtist) {
            self.artist = fetchedArtist;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateViews];
            });
        } else {
            NSLog(@"No data returned; most likely improperly typed artist");
        }
    }];
    // CONSIDER REDUNDANCY HERE... experiment with removing one or the other updateViews
    [self updateViews];
}


- (IBAction)saveButtonPressed:(id)sender {
    
    if (!_artist) {
        _artist = [[LSIArtist alloc] init];
    }
    // add Artist to bands array to persist
    [self.artistController addArtist:_artist];
    [self.navigationController popViewControllerAnimated:YES];
}

@end



