//
//  ArtistDetailViewController.m
//  DMOArtistsWeek14SprintChallenge
//
//  Created by morse on 1/24/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import "DMOArtistDetailViewController.h"
#import "DMOArtistController.h"
#import "DMOArtist.h"

@interface DMOArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *aboutTextView;

@end

@implementation DMOArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)saveTapped:(id)sender {
    if (self.artist) {
        NSLog(@"saveTapped");
        [self.artistController saveArtist:self.artist];
        [self.navigationController popViewControllerAnimated:true];
    }
}



- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchTerm = searchBar.text;
    
    [self.artistController searchForArtistWithName:searchTerm completion:^(DMOArtist *artist, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Artist: %@, Error: %@", artist.name, error);
            self.artist = artist;
            [self updateViews];
            NSLog(@"called!");
        });
    }];
}

@end
