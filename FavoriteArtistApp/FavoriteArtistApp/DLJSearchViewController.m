//
//  DLJSearchViewController.m
//  FavoriteArtistApp
//
//  Created by Diante Lewis-Jolley on 7/19/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

#import "DLJSearchViewController.h"
#import "DLJJSONSerialization.h"
#import "DLJArtist.h"
#import "DLJArtistController.h"

@interface DLJSearchViewController ()

@end

@implementation DLJSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

-(void)updateViews {
    self.artistNameLabel.text = @"";
    self.formedLabel.text = @"";
    [self.searchBar setDelegate:self];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

    [self.artistController fetchArtistsWithName:searchBar.text completion:^(DLJArtist *artist, NSError *error) {

        if (error) {
            NSLog(@"Error searching for artist: %@", error);
            return;
        }

        dispatch_async(dispatch_get_main_queue(), ^ {
            self.searchedArtist = artist;
            self.artistNameLabel.text = self.searchedArtist.name;
            self.textView.text = self.searchedArtist.bio;
            NSString *formedString = [NSString stringWithFormat:@"Formed in %d", self.searchedArtist.yearFormed];
            self.formedLabel.text = formedString;

        });
    }];

}

-(void)saveArtist:(DLJArtist *)artist {
    if (artist) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:[artist artistDictionary] options:0 error:nil];
        NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        NSURL *url = [[directory URLByAppendingPathComponent:self.searchedArtist.name] URLByAppendingPathExtension:@"json"];

        [data writeToURL:url atomically:YES];
    } else {
        NSLog(@"Error saving new artist");
        return;
    }
    return;
}



- (IBAction)saveButtonTapped:(id)sender {

    if (self.searchedArtist) {
        [self saveArtist:_searchedArtist];
        [self.navigationController popToRootViewControllerAnimated:true];
    } else {
        NSLog(@"Invalid Arist");
    }
}



@end
