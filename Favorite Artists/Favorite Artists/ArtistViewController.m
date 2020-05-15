//
//  ArtistViewController.m
//  Favorite Artists
//
//  Created by Wyatt Harrell on 5/15/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

#import "ArtistViewController.h"
#import "WAHArtistController.h"
#import "WAHArtist.h"

@interface ArtistViewController ()<UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *biographyTextView;

@property (nonatomic) WAHArtist *artist;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
}

- (void)updateViews {
    self.nameLabel.hidden = NO;
    self.yearFormedLabel.hidden = NO;
    self.biographyTextView.hidden = NO;
    
    self.nameLabel.text = self.artist.artist;

    if (self.artist.yearFormed == 0) {
        self.yearFormedLabel.text = @"N/A";
    } else {
        self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
    }
    self.biographyTextView.text = self.artist.biography;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.artistController fetchArtistWithName:searchBar.text completionBlock:^(WAHArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Fetching Error: %@", error);
            return;
        }
        
        NSLog(@"Fetched artist: %@", artist);
        self.artist = artist;
        
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateViews];
        });
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
}


@end
