//
//  SLRDetailViewController.m
//  FavoriteArtists
//
//  Created by Sameera Roussi on 7/19/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

#import "SLRDetailViewController.h"
#import "SLRFetchArtist.h"
#import "SLRArtist.h"
#import "SLRArtist+NSJSONSerialization.h"

@interface SLRDetailViewController ()

// Properties


// Outlets
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

// Actions
- (IBAction)savedButtonTapped:(id)sender;

@end

@implementation SLRDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Grab the search bar
     [[self searchBar] setDelegate:self];
    
    if([self.fetchedArtist artistName]) {
        self.searchBar.hidden = true;
        [self setTitle:[[self fetchedArtist] artistName]];

    
        NSString *originYear = [NSString stringWithFormat:@"First appeared in %d", self.fetchedArtist.yearFormed];
        self.artistNameLabel.text = originYear;
        self.textView.text = self.fetchedArtist.biography;
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
   
    // Let the user know what's going on
    self.textView.text = @"";
    self.yearFormedLabel.text = [NSString stringWithFormat:@"Searching for %@...", searchBar.text];
    
    [self.fetchartist fetchArtistsByName:searchBar.text completionBlock:^(SLRArtist *artist, NSError *error) {
       
        // Check for an error
        if (error) {
            error = error;
            NSLog(@"\vError attempting to fetch artist: %@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^ {
            
            
            NSString *uiMessage = @"";
            
            if([artist artistName]) {
                self.fetchedArtist = artist;
                self.artistNameLabel.text = artist.artistName;
                
                // Check the yearFormed value and display the value in the yearFormed textField
                NSLog(@"\nThe artist.yearFormed vale is: %d",artist.yearFormed);
                if(artist.yearFormed == 0) {
                    [[self yearFormedLabel] setText:@"Year first appeared not available at this time."];
                } else {
                     uiMessage = [NSString stringWithFormat:@"First appeared in %d", artist.yearFormed];
                    self.yearFormedLabel.text = uiMessage;
                }
                // Display the biography in the textView
                self.textView.text = artist.biography;

            } else {
                uiMessage = @"Artist has not been added to the AudioDB yet.";
                self.textView.text = uiMessage;
            }
            
            
        });
        
    }];
    
    [searchBar setText:@""];
    self.textView.text = @"";
}


-(void)saveArtist:(SLRArtist *)artistRetrieved {
    if (artistRetrieved) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:[artistRetrieved artistData] options:0 error:nil];
        NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        NSURL *url = [[directory URLByAppendingPathComponent:self.fetchedArtist.artistName] URLByAppendingPathExtension:@"json"];
        
        [data writeToURL:url atomically:YES];
    } else {
        NSLog(@"Error saving new artist");
        return;
    }
    return;
}

- (IBAction)savedButtonTapped:(id)sender {
    if (self.fetchedArtist) {
        [self saveArtist:self.fetchedArtist];
        [self.navigationController popToRootViewControllerAnimated:true];
    } else {
        NSLog(@"Invalid Arist");
    }
}


@end
