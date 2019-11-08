//
//  LSIAddArtistViewController.m
//  FavoriteArtist
//
//  Created by Lambda_School_Loaner_214 on 11/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "LSIAddArtistViewController.h"
#import "LSIArtistController.h"

@interface LSIAddArtistViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameTF;
@property (weak, nonatomic) IBOutlet UILabel *formedInTF;
@property (weak, nonatomic) IBOutlet UITextView *bioTV;

@end

@implementation LSIAddArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
}

- (IBAction)saveTapped:(id)sender {
    if (self.artist) {
        [self.artistController saveArtist:self.artist];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)updateViews{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.artist && self.viewLoaded) {
            self.artistNameTF.text = self.artist.name;
            self.bioTV.text = self.artist.bio;
            self.formedInTF.text = [NSString stringWithFormat:@"Formed in %i", self.artist.formedDate];
        }
    });
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    //NSLog(@"Searchbar: %@", searchBar);
    [self.artistController searchForArtist:searchBar.text completion:^(LSIArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error searching artist: %@", error);
            return;
        }
        if (artist) {
            self.artist = artist;
            [self updateViews];
        }
    }];
}

@end
