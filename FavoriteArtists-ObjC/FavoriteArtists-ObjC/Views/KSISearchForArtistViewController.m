//
//  KSISearchForArtistViewController.m
//  FavoriteArtists-ObjC
//
//  Created by Kevin Stewart on 7/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import "KSISearchForArtistViewController.h"
#import "KSIArtistController.h"
#import "KSIArtist.h"

@interface KSISearchForArtistViewController ()

// Properties
@property (nonatomic) KSIArtistController *ksiArtistController;
@property (nonatomic) KSIArtist *ksiArtist;

// Outlets
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *artistStartDateLabel;
@property (strong, nonatomic) IBOutlet UITextView *artistBiography;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;

// File Methods
- (void)updateViews;
- (void)saveArtist;

@end

@implementation KSISearchForArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ksiArtistController = [[KSIArtistController alloc]init];
    self.searchBar.delegate = self;
    [self updateViews];
}

- (void)updateViews
{
    self.artistNameLabel.text = self.ksiArtist.name;
    self.artistStartDateLabel.text = [NSString localizedStringWithFormat:@"Started in %d", self.ksiArtist.yearArtistFormed];
    self.artistBiography.text = self.ksiArtist.biography;
}

- (void)saveArtist
{
    [self.ksiArtistController addArtist:[[KSIArtist alloc] initWithName:self.ksiArtist.name
                                                        artistBiography:self.ksiArtist.biography
                                                       yearArtistFormed:self.ksiArtist.yearArtistFormed]];
}

- (IBAction)saveButtonTapped:(id)sender
{
    [self saveArtist];
    [self.navigationController popToRootViewControllerAnimated:true];
}

//- (void)searchBarTapped:(UISearchBar *)searchBar
//{
//    NSString *searchTerm = searchBar.text;
//    [self.ksiArtistController searchForArtists:searchTerm
//                                    completion:^(KSIArtist *artist, NSError *error) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.ksiArtist = artist;
//            [self updateViews];
//            NSLog(@"Artist found: %@", artist);
//        });
//    }];
//}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"pressed Return inside search bar");
    NSString *searchTerm = searchBar.text;
    [self.ksiArtistController searchForArtists:searchTerm
                                    completion:^(KSIArtist *artist, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.ksiArtist = artist;
            [self updateViews];
            NSLog(@"Artist found: %@", artist);
        });
    }];
}


@end
