//
//  SearchArtistsViewController.m
//  FavoriteArtistsSprintChallenge
//
//  Created by Dillon P on 4/19/20.
//  Copyright © 2020 Dillon's Lambda Team. All rights reserved.
//

#import "SearchArtistsViewController.h"

@interface SearchArtistsViewController ()

// Properties
@property (nonatomic) NSString *artistName;
@property (nonatomic) NSString *yearFounded;
@property (nonatomic) NSString *artistBio;


// IBOutlets
@property (nonatomic) IBOutlet UILabel *artistNameLabel;
@property (nonatomic) IBOutlet UILabel *yearFoundedLabel;
@property (nonatomic) IBOutlet UITextView *artistBioTextView;
@property (nonatomic) IBOutlet UISearchBar *artistSearchBar;

// Private Methods
- (void)saveNewFavoriteArtist;
- (void)searchForArtistWithName:(NSString *)artistName;

@end


@implementation SearchArtistsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// MARK: - Private Methods

- (void)saveNewFavoriteArtist
{
    
}

- (void)searchForArtistWithName:(NSString *)artistName
{
    
}


// MARK: - IBActions

- (IBAction)saveButtonTapped:(id)sender
{
    [self saveNewFavoriteArtist];
}

@end
