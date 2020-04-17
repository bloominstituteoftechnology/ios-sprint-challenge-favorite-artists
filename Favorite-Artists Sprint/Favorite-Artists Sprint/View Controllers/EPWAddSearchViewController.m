//
//  EPWAddSearchViewController.m
//  Favorite-Artists Sprint
//
//  Created by Elizabeth Wingate on 4/17/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

#import "EPWAddSearchViewController.h"

@implementation EPWAddSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    switch (self.viewType) {
        case Search:
        [self.searchBar setHidden:NO];
        break;
                
    case Detail:
        [self.searchBar setHidden:YES];
        self.navigationItem.rightBarButtonItem = nil;
        break;
    }
    [self.searchBar setDelegate:self];
    [self updateViews];
}

- (void)updateViews {
    if (self.artist != nil) {
        self.title = self.artist.name;
        self.nameLabel.text = self.artist.name;
        self.yearLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.artist.formedYear];
        self.bioTextView.text = self.artist.biography;
    } else {
        self.title = @"Add New Artist";
  }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *query = searchBar.text;
    
    [self.artistController searchForArtist:query completion:^(EPWArtist *artist, NSError *error) {
        if (error){
            NSLog(@"Error searching artist");
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
          self.artist = artist;
          self.nameLabel.text = artist.name;
          self.yearLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)artist.formedYear];
          self.bioTextView.text = artist.biography;
        });
        NSLog(@"Search result: %@", artist);
     }
    }];
    [self.searchBar endEditing:YES];
}

- (IBAction)savePressed:(id)sender {
        if (_artist == nil) {
            return;
    }

    NSData *data = [NSJSONSerialization dataWithJSONObject: [self.artist toDictionary] options:0 error:nil];
    NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    NSURL *url = [[directory URLByAppendingPathComponent:self.artist.name] URLByAppendingPathExtension: @"json"];
        
    [data writeToURL:url atomically:YES];

    [self.delegate didSave:_artist];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
