//
//  LYDArtistDetailViewController.m
//  LYDFavoriateArtist
//
//  Created by Lydia Zhang on 5/15/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

#import "LYDArtistDetailViewController.h"
#import "LYDArtist.h"
#import "LYDArtistController.h"
#import "LYDArtist+LYDJSONHelper.m"
#import "LYDArtistsTableViewController.h"


@interface LYDArtistDetailViewController ()
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;
@property (strong, nonatomic) IBOutlet UITextView *biographyLabel;
@property (strong, nonatomic) IBOutlet UILabel *formedInLabel;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation LYDArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate: self];
    [self setUpViews];
}



-(void)setUpViews{
    
    if (self.artist != nil){
        self.navigationItem.title = [NSString stringWithFormat:@"%@", self.artist.name];
        self.nameLabel.text = self.artist.name;
        self.biographyLabel.text = self.artist.biography;
        self.yearLabel.text = [self yearStr];
        self.formedInLabel.text = @"Formed in:";
        self.formedInLabel.hidden = NO;
        self.saveButton.accessibilityElementsHidden = YES;
    } else if (self.artist == nil){
        self.navigationItem.title = @"Add New Artists";
        self.nameLabel.text = @"";
        self.biographyLabel.text = @"";
        self.yearLabel.text = @"";
        self.formedInLabel.hidden = YES;
        self.saveButton.accessibilityElementsHidden = NO;
    }
        
}

- (NSString *)yearStr {
    if (self.artist.year != 0) {
        return [NSString stringWithFormat:@"%i", self.artist.year];
    } else {
        return [NSString stringWithFormat:@"%i: (year not found)", 0];
    }
}
- (IBAction)saveTapped:(id)sender {
    if (self.artist){
        [self.artistController saveArtist:self.artist];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSString *searchTerm = searchBar.text;
    [searchBar resignFirstResponder];
    [self.artistController findArtistWithName:searchTerm completion:^(LYDArtist *artist, NSError *error) {
        if (artist){
            dispatch_async(dispatch_get_main_queue(), ^{
                self.artist = artist;
                [self setUpViews];
            });
        }
    }];
}


@end
