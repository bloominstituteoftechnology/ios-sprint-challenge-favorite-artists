//
//  ArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_268 on 5/18/20.
//  Copyright © 2020 Lambda. All rights reserved.
//
#import "MSKArtistDetailViewController.h"
#import "MSKArtist.h"
#import "MSKArtistController.h"
#import "MSKArtist+NSJSONSerialization.h"

@interface MSKArtistDetailViewController ()
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *bioTV;
@end
@implementation MSKArtistDetailViewController
- (IBAction)saveTapped:(UIBarButtonItem *)sender {
    NSDictionary *dict = [_artist toDict];
    [self.controller.artists addObject:dict];
    [self.navigationController popViewControllerAnimated:YES];
    [self.controller saveArtistToPersistence:_artist completionBlock:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Saving error!");
        }
    }];
}
-(void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
    [self updateViews];
}
-(void)updateViews {
    if (_artist) {
        dispatch_async(dispatch_get_main_queue(), ^ {
            self.artistNameLabel.text = self.artist.artistName;
            self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %i", self.artist.yearFormed];
            self.bioTV.text = self.artist.artistBiography;
        });
    } else {
        self.artistNameLabel.text = @"";
        self.yearFormedLabel.text = @"";
        self.bioTV.text = @"";
    }
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchTerm = searchBar.text;
    [self.controller fetchArtistWithName:searchTerm completionBlock:^(MSKArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", [NSString stringWithFormat:@"There was a error: %@", error]);
            return;
        }
        if (self.artist != artist) {
            self.artist = artist;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateViews];
                return;
            }
);
        }
    }];
}
@end
