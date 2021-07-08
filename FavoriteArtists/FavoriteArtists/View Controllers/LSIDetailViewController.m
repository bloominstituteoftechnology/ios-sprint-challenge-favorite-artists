//
//  LSIDetailViewController.m
//  FavoriteArtists
//
//  Created by Alex on 7/19/19.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "LSIDetailViewController.h"
#import "LSIArtistController.h"
#import "LSINSObject+JSONSerialization.h"
#import "LSIArtist.h"

@interface LSIDetailViewController ()


@end

@implementation LSIDetailViewController

- (void)myArtist:(LSIArtist *)artist {
    if (artist != _artist) {
        _artist = artist;
        [self updateViews];
    }
}

- (IBAction)saveBtnPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.searchBar.delegate = self;
    [self updateViews];
    // Do any additional setup after loading the view.
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    // Fetch Artist from artistController here
    NSString *searchTerm = searchBar.text;
    [self.artistController fetchArtist:searchTerm completionBlock:^(NSArray * _Nonnull allArtists, NSError * _Nonnull error) {
        if (error) {
            return NSLog(@"Error: fetching artist %@", error);
        }
        
        self.artist = [[LSIArtist alloc] init];
        self.artist = allArtists[0];
        
        [self updateViews];
    }];
}

- (void)updateViews {
    // needs to be completed on the main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"HERE in updateViews");
        
        if (!self.isViewLoaded || !self.artist){return;}
        
        self.title = self.artist.name;
        self.nameLbl.text = self.artist.name;
        self.formedLbl.text = [NSString stringWithFormat:@"%d", self.artist.formed];
        self.detailTextView.text = self.artist.bio;
    });
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
