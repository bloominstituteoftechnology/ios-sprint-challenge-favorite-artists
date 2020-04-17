//
//  EGCArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Enrique Gongora on 4/17/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

#import "EGCArtistDetailViewController.h"
#import "EGCArtistController.h"
#import "EGCArtist.h"

@interface EGCArtistDetailViewController ()

// MARK: - IBOutlets
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *aboutTextView;

@end

@implementation EGCArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
    [self updateViews];
}

- (void)updateViews {
    self.nameLabel.text = self.artist.name;
    self.aboutTextView.text = self.artist.about;
    self.yearLabel.text = [self yearString];
}

- (NSString *)yearString {
    if (self.artist.year != 0) {
        return [NSString stringWithFormat:@"%i", self.artist.year];
    } else {
        return @"Not available";
    }
}

// MARK: - IBActions
- (IBAction)saveTapped:(id)sender {
    if (self.artist) {
        NSLog(@"saveTapped");
        [self.artistController saveArtist:self.artist];
        [self.navigationController popViewControllerAnimated:true];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchTerm = searchBar.text;
    
    [self.artistController searchForArtistWithName:searchTerm completion:^(EGCArtist *artist, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Artist: %@, Error: %@", artist.name, error);
            self.artist = artist;
            [self updateViews];
            NSLog(@"called!");
        });
    }];
}

@end
