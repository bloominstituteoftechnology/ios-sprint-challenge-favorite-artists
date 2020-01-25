//
//  LSISearchArtistViewController.m
//  Favorite Artists
//
//  Created by macbook on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSISearchArtistViewController.h"
#import "LSIArtist.h"
#import "LSIArtistController.h"

@interface LSISearchArtistViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *artistSearchBar;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;
@property (weak, nonatomic) IBOutlet UILabel *formedLabel;

@end

@implementation LSISearchArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.artistSearchBar setDelegate:self];
    [self updateViews];

}
- (IBAction)saveBarButtonTapped:(UIBarButtonItem *)sender {
    
    NSString *name = self.nameLabel.text;
    NSString *bio = self.bioTextView.text;
    NSString *yearString = self.yearFormedLabel.text;
    int yearInt = [yearString integerValue];

    
    if (self.artist) {
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } else {
        
        [self.artistController AddArtistWithName:name biography:bio yearFormed:yearInt];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.artistController searchArtistWithSearchTerm:self.artistSearchBar.text completion:^(NSError *error) {
        
        if (error) {
            NSLog(@"Error searching for artist: %@", error);
            return;
        } else {
            
            
            dispatch_async(dispatch_get_main_queue(), ^ {
                
                self.artist = self.artistController.fetchedArtist;
                [self updateViews];
            });
        }
    }];
}

- (void)updateViews {
    
    if (self.artist) {
        
        NSString *yearNumber = [@(self.artist.yearFormed) stringValue];
        
        self.title = self.artist.name;
        self.nameLabel.text = self.artist.name;
        self.yearFormedLabel.text = yearNumber;
        self.bioTextView.text = self.artist.biography;
        self.formedLabel.text = @"Formed in";
    } else {
        self.title = @"Search Artist";
        self.nameLabel.text = @"";
        self.yearFormedLabel.text = @"";
        self.bioTextView.text = @"";
        self.formedLabel.text = @"";
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
