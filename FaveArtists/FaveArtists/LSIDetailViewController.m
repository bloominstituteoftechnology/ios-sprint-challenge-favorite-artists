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
        
        // bio isn't showing, check constraints
        self.bioTextView.text = self.artist.strBiographyEN;
        
    });
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    //_artistController = [[LSIArtistController alloc] init];
    //NSError *error = nil;
    
    NSString *searchText = self.artistSearchBar.text;
    
    [_artistController fetchArtistWith:searchText completionBlock:^(NSArray * _Nonnull bands, NSError * _Nonnull error) {

        // best to extract from 'bands' the information for artist in this viewcontroller
        if (bands) {
            self.artist = self.artistController.bands[0];      // MUST FIX THIS SO IT DOESN'T just grab zeroeth element (a test)
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateViews];
            });
            
        } else {
            NSLog(@"No data returned; most likely improperly typed artist");
        }
    }];
    // UPDATE VIEWS NOT GOING TO WORK UNLESS WE EXTRACT THE ARTIST GRABBED FROM THE NETWORK CALL ABOVE
    [self updateViews];
}



- (IBAction)saveButtonPressed:(id)sender {
    
    if (!_artist) {
        _artist = [[LSIArtist alloc] init];
    }
    
    //[self createArtistFromSearchResults:_artist];  // is artist ok going func to func here?
    // add Artist to bands array to persist
    [self.artistController addArtist:_artist];
    [self.navigationController popViewControllerAnimated:YES];
}

//- (void)createArtistFromSearchResults:(LSIArtist *)artist {
//    artist.strArtist = self.artistLabel.text;
//    artist.intFormedYear = self.yearFoundedLabel.text;
//    artist.strBiographyEN = self.bioTextView.text;
//
//    // set Labels and textField back to default or blank
//}




@end



