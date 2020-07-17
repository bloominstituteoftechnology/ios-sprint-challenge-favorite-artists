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

@property (nonatomic) UISearchBar IBOutlet *searchBar;
@property (nonatomic) UIBarButtonItem IBOutlet *saveButton;

@property (nonatomic) UILabel IBOutlet *nameLabel;
@property (nonatomic) UILabel IBOutlet *formedLabel;
@property (nonatomic) UILabel IBOutlet *bioLabel;

@property ArtistController *controller;

@end

@implementation ArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
    
    if (self.artist) {
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
    if (self.artist) {
        self.searchBar.hidden = YES;
        
        self.title = self.artist.name;
        
        self.nameLabel.text = self.artist.name;
        self.formedLabel.text = [NSString stringWithFormat:@"Formed in %d", self.artist.formed];
        self.bioLabel.text = self.artist.bio;
    }
}

// MARK: - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *query = self.searchBar.text;
    
    if (query) {
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
