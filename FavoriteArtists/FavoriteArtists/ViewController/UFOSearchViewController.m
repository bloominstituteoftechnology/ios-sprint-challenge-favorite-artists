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
#import "UFOArtist+NSJSONSerialization.h"

@interface UFOSearchViewController ()

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTV;

@end

@implementation UFOSearchViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
    [self updateViews];
}

- (IBAction)save:(id)sender {
    if (self.artist) {
        [self.apiController addArtist:self.artist];
    } else {
        NSLog(@"Error saving");
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateViews {
    if (self.artist != nil) {
        self.nameLabel.text = self.artist.name;
        self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in: %ld", (long)self.artist.yearFormed];
        self.bioTV.text = self.artist.biography;
    }
}
    
- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [self.apiController searchArtistWithStrArtist:searchBar.text completion:^(UFOArtist * artist) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (artist){
                NSLog(@"something");
                self.artist = artist;
                [self updateViews];
            }
        });
    }];
}

@end
