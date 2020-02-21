//
//  RWSearchViewController.m
//  Favorite Artists
//
//  Created by Rick Wolter on 2/21/20.
//  Copyright © 2020 Devshop7. All rights reserved.
//

#import "RWSearchViewController.h"
#import "RWArtistController.h"
@interface RWSearchViewController ()


@property RWArtist *artist;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

- (IBAction)saveButton;
- (void)updateViews;




@end

@implementation RWSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
    [self updateViews];
    // Do any additional setup after loading the view.
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.artistController searchArtistByName:searchBar.text completion:^(RWArtist * artist, NSError * error) {
        if (error) {
            NSLog(@"Error searching: %@", error);
            return;
        } else if (artist) {
            self.artist = artist;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateViews];
            });
        }
    }];
}

- (IBAction)saveButton {
    if (self.artist) {
        [self.artistController.artists addObject:self.artist];
        [self.artistController saveArtists];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        NSLog(@"Error saving artist named %@", self.searchBar.text);
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
- (void)updateViews {
    if (self.artist) {
        self.nameLabel.text = self.artist.name;
        NSInteger valid = self.artist.yearFormed;
        if (valid == 0) {
            self.yearLabel.text = @"Formed in: ?";
        } else {
            self.yearLabel.text = [NSString stringWithFormat:@"Formed in %li", (long)self.artist.yearFormed];
        }
        self.bioTextView.text = self.artist.bio;
    } else {
        self.nameLabel.text = @"";
        self.yearLabel.text = @"";
        self.bioTextView.text = @"";
    }
}

@end
