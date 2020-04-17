//
//  SearchViewController.m
//  FavoriteArtists
//
//  Created by Ufuk Türközü on 17.04.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

#import "UFOSearchViewController.h"
#import "UFOAPIController.h"
#import "UFOArtist.h"

@interface UFOSearchViewController () <UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *FormedInLabel;
@property (weak, nonatomic) IBOutlet UITextView *InfoTV;

@end

@implementation UFOSearchViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.searchBar.delegate = self;
}

- (IBAction)save:(id)sender {
    
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.apiController searchArtistWithName:searchBar.text.lowercaseString completionBlock:^(NSArray<UFOArtist *> * _Nullable artist, NSError * _Nullable error) {
        self.artist = artist;
    }];
}

@end
