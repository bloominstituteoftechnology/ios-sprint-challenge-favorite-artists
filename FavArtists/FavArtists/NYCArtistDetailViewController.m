//
//  NYCArtistDetailViewController.m
//  FavArtists
//
//  Created by Nathanael Youngren on 4/5/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

#import "NYCArtistDetailViewController.h"

@interface NYCArtistDetailViewController ()

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *artistBiographyTextView;

@end

@implementation NYCArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self searchBar] setDelegate: self];
    [self updateViews];
}

- (void)updateViews {
    NYCArtist *artist = [self artist];
    
    if (artist) {
        [[self searchBar] setHidden:YES];
        [[self saveButton] setAccessibilityElementsHidden:YES];
        [[self artistNameLabel] setText: artist.name];
        
        NSNumber *yearFormed = [NSNumber numberWithInteger: artist.yearFormed];
        
        [[self yearFormedLabel] setText: yearFormed.stringValue];
        [[self artistBiographyTextView] setText: artist.biography];
    } else {
        [[self searchBar] setHidden:NO];
        [[self saveButton] setAccessibilityElementsHidden:NO];
        [[self artistNameLabel] setText: @""];
        [[self yearFormedLabel] setText: @""];
        [[self artistBiographyTextView] setText: @""];
    }
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
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
