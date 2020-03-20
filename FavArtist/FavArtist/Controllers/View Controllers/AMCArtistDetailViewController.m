//
//  AMCArtistDetailViewController.m
//  FavArtist
//
//  Created by Aaron Cleveland on 3/20/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

#import "AMCArtistDetailViewController.h"
#import "AMCArtist.h"
#import "AMCArtistController.h"
#import "AMCArtist+NSJSONSerialization.h"

@interface AMCArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistName;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *artistBioTextView;

@end

@implementation AMCArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
    [self updateViews];
    
}

- (IBAction)save:(UIBarButtonItem *)sender {
    AMCArtist *artist = [[AMCArtist alloc] initWithArtistName:self.artistName.text biography:self.artistBioTextView.text formed:self.artist.yearFormed];
    [self.artistController addArtist:artist];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateViews {
    if (self.artist) {
        //    self.title = self.artist.artist;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.artistName.text = self.artist.name;
            self.yearFormedLabel.text =  [NSString stringWithFormat:@"Formed in %i", self.artist.yearFormed];
            self.artistBioTextView.text = self.artist.bio;
        });
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchTerm = searchBar.text;
    [_artistController fetchArtist:searchTerm completionHandler:^(AMCArtist *artist, NSError *error) {
        self.artist = artist;
        dispatch_async(dispatch_get_main_queue(), ^{
            if (artist) {
                [self updateViews];
            }
        });
    }];
}

- (void)setArtist:(AMCArtist *)artist{
    if (_artist != artist) {
        _artist = artist;
        [self updateViews];
    }
}


@end

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    [self.searchBar setDelegate:self];
//    [self updateViews];
//}
//
//- (IBAction)save:(UIBarButtonItem *)sender {
//    Artist *artist = [[Artist alloc] initWithArtistName:self.artistName.text biography:self.artistBioTextView.text formed:self.artist.yearFormed];
//    [self.artistController addArtist:artist];
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
//
//- (void)updateViews
//{
//    self.title = self.artist.name ?: @"Add new artist";
//    if (!self.isViewLoaded || !self.artist) { return; }
//    self.artistName.text = self.artist.name;
//    self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %i", self.artist.yearFormed];
//    self.artistBioTextView.text = self.artist.bio;
//}
//
//- (void)setArtist:(Artist *)artist
//{
//    if (_artist != artist) {
//        _artist = artist;
//        [self updateViews];
//    }
//}
//
//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
//{
//    NSString *searchTerm = searchBar.text;
//    [_artistController fetchArtist:searchTerm completionHandler:^(Artist *artist, NSError *error) {
//        self.artist = artist;
//        [self updateViews];
//    }];
//    }
//
//
//
//@end
