//
//  DBESearchViewController.m
//  FavoriteArtists
//
//  Created by Dahna on 7/17/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

#import "DBEShowSearchViewController.h"
#import "DBEArtist.h"
#import "DBEArtistController.h"
#import "DBEArtistFetcher.h"
#import "DBEArtist+NSJSONSerialization.h"

@interface DBEShowSearchViewController()<UISearchBarDelegate>



@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (nonatomic) DBEArtist *searchedArtist;
@property (nonatomic) DBEArtist *injectedArtist;
@property (nonatomic) BOOL artistExists;

@end

@implementation DBEShowSearchViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];
    self.saveButton.enabled = NO;
    [self updateViews];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.searchBar setDelegate:self];
    
    if (self.artist != nil) {
        self.artistExists = YES;
    } else {
        self.artistExists = NO;
        [self updateViews];
    }
    
    if (self.searchedArtist) {
        [self updateViews];
    } else {
    }
}

- (IBAction)saveButtonTapped:(id)sender {
    if (self.searchedArtist) {
        [self saveArtist:_searchedArtist];
        
    } else {
        NSLog(@"Artist to save is Nil");
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    DBEArtistFetcher *fetcher = [[DBEArtistFetcher alloc] init];
    
    [fetcher fetchArtist:searchBar.text completion:^(DBEArtist * artist, NSError * error) {
        if (error) {
            NSLog( @"Error fetching %@", error);
            return;
        } else {
            dispatch_async(dispatch_get_main_queue(), ^ {
                self.searchedArtist = artist;
                [self.navigationItem setTitle:artist.name];
                [self -> _artistLabel setText:artist.name];

                NSString *yearString = [NSString stringWithFormat:@"Formed in: %d", artist.year];

                [self -> _yearLabel setText:yearString];
                [self -> _biographyTextView setText:artist.biography];
                self.saveButton.enabled = YES;

            });
        }
    }];
}

- (void)saveArtist: (DBEArtist *) artist {
    if (artist) {
        
        NSData *artistData = [NSJSONSerialization dataWithJSONObject:[artist toDictionary]
                                                             options:0
                                                               error:nil];
        
        NSURL *documentDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                                          inDomain:NSUserDomainMask
                                                                 appropriateForURL:nil
                                                                            create:YES
                                                                             error:nil];

        NSURL *artistURL = [[documentDirectory URLByAppendingPathComponent:_searchedArtist.name] URLByAppendingPathExtension:@"json"];
        
        [artistData writeToURL:artistURL atomically:YES];
    } else {
        NSLog(@"Error saving artist.");
        return;
    }
}

- (void) updateViews {
    
    if (self.artistExists == YES) {
        self.title = self.artist.name;
        self.artistLabel.text = self.artist.name;
        
        if (self.artist.year == 0) {
            self.yearLabel.text = @"No Information Available";
        } else {
            
            self.yearLabel.text = [NSString stringWithFormat:@"Formed in: %d", self.artist.year];
        }
        self.biographyTextView.text = self.artist.biography;
    } else {
        self.artistLabel.text = self.searchedArtist.name;
        if (self.searchedArtist.year == 0) {
            self.yearLabel.text = @"No Information Available";
        } else {
            self.yearLabel.text = [NSString stringWithFormat:@"Formed in: %d", self.searchedArtist.year];
        }
        self.biographyTextView.text = self.searchedArtist.biography;
    }
}



@end
