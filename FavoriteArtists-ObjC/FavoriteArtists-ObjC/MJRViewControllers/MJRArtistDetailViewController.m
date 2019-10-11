//
//  MJRArtistDetailViewController.m
//  FavoriteArtists-ObjC
//
//  Created by Marlon Raskin on 10/11/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

#import "MJRArtistDetailViewController.h"
#import "MJRArtistController.h"
#import "MJRArtist.h"

@interface MJRArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;


@end

@implementation MJRArtistDetailViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        _artistController = [[MJRArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
}

- (IBAction)saveTapped:(UIBarButtonItem *)sender {

}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    self.searchBar.showsCancelButton = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    self.searchBar.showsCancelButton = NO;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *artistSearchQuery = self.searchBar.text;
    [_artistController searchArtistWithName:artistSearchQuery completion:^(MJRArtist *artist, NSError *error) {
        if (error) {
            NSLog(@"Error fetching artist data with searchQuery: %@:", error);
            return;
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            self.artistNameLabel.text = artist.artistName;
            NSString *yearFormedStr = [NSString stringWithFormat:@"Year formed: %d", artist.yearFormed];
            self.yearFormedLabel.text = yearFormedStr;
            self.bioTextView.text = artist.bio;
        });
    }];

    [self.searchBar resignFirstResponder];
}

@end
