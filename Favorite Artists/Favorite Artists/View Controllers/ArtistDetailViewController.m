//
//  ArtistDetailViewController.m
//  Favorite Artists
//
//  Created by Vincent Hoang on 7/17/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "Artist.h"
#import "ArtistController.h"
#import "Artist+NSJSONSerialization.h"

@interface ArtistDetailViewController () <UISearchBarDelegate>

@property (nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic) IBOutlet UILabel *formedLabel;
@property (nonatomic) IBOutlet UILabel *bioLabel;

@property (nonatomic, strong) ArtistController *controller;

@end

@implementation ArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
    self.controller = [ArtistController alloc];
    
    if (self.artist != nil) {
        [self updateViews];
    }
}

// MARK: - IBAction
- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender {
    [self save];
}

// MARK: - Persistence
- (void) save {
    if (self.artist) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:[self.artist toDictionary]
                                                       options:0
                                                         error:nil];
        
        NSURL *directoryUrl = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                                     inDomain:NSUserDomainMask
                                                            appropriateForURL:nil
                                                                        create:YES
                                                                        error:nil];
        
        NSURL *extension = [[directoryUrl URLByAppendingPathComponent:self.artist.name]
                            URLByAppendingPathExtension: @"json"];
        
        [data writeToURL:extension
              atomically:YES];
    }
}

// MARK: - Utility

- (void)updateViews {
    self.searchBar.hidden = YES;
    
    self.title = self.artist.name;
    
    self.nameLabel.text = self.artist.name;
    self.formedLabel.text = [NSString stringWithFormat:@"Formed in %d", self.artist.formed];
    self.bioLabel.text = self.artist.bio;
}

// MARK: - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"search button pressed");
    [self search];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [self search];
}

- (void)search {

    NSString *query = self.searchBar.text;
    
    if (query.length > 0) {
    
        [self.controller fetchArtistsByName:query
                                 completion:^(Artist * _Nullable artist, NSError * _Nullable error) {
            if (error) {
                NSLog(@"Error getting artists: %@", error);
                return;
            }
            
            self.artist = artist;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateViews];
            });
        }];
        
    }
}

@end
