//
//  KTMArtistSearchViewController.m
//  ObjC-FavoriteArtist
//
//  Created by Kobe McKee on 7/19/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

#import "KTMArtistSearchViewController.h"
#import "KTMArtist+KTMNSJSONSerialization.h"
#import "KTMArtist.h"
#import "KTMArtistController.h"


@interface KTMArtistSearchViewController () <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;

@end

@implementation KTMArtistSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = @"";
    self.yearLabel.text = @"";
    self.biographyTextView.text = @"";
    [self.searchBar setDelegate:self];
    
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.artistController searchForArtist:searchBar.text completionBlock:^(KTMArtist *artist, NSError *error) {
        
        if (error) {
            NSLog(@"Error searching for artist: %@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^ {
            self.searchedArtist = artist;
            self.nameLabel.text = self.searchedArtist.name;
            self.yearLabel.text = [NSString stringWithFormat:@"Formed %d", self.searchedArtist.yearFormed];
            self.biographyTextView.text = self.searchedArtist.biography;
        });
    }];
}


- (IBAction)saveButtonPressed:(id)sender {
    if (self.searchedArtist) {
        [self saveArtist:_searchedArtist];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        NSLog(@"No artist to save");
    }
    
    
}


- (void)saveArtist:(KTMArtist *)artist {
    if (artist) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:[artist createArtistDictionary] options:0 error:nil];
        NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        NSURL *url = [[directory URLByAppendingPathComponent:self.searchedArtist.name] URLByAppendingPathExtension:@"json"];
        
        [data writeToURL:url atomically:YES];
    } else {
        NSLog(@"Error saving new artist");
        return;
    }
    return;
}









@end
