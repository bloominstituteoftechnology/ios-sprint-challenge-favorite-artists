//
//  LSIArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Luqmaan Khan on 10/11/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

#import "LSIArtistDetailViewController.h"
#import "LSIArtist.h"
#import "LSIArtistController.h"
#import "LSIArtist+NSJSONSerialization.h"

@interface LSIArtistDetailViewController ()
@property (strong, nonatomic) IBOutlet UISearchBar *artistSearchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistName;
@property (strong, nonatomic) IBOutlet UILabel *yearFormed;
@property (strong, nonatomic) IBOutlet UITextView *bioTextView;

@end

@implementation LSIArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _artistSearchBar.delegate = self;
    [self updateViews];
}



-(void)saveArtist:(LSIArtist *)artistRetrieved {
    if (artistRetrieved) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:[artistRetrieved artistData] options:0 error:nil];
        NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        NSURL *url = [[directory URLByAppendingPathComponent:self.artist.artistName] URLByAppendingPathExtension:@"json"];
        [data writeToURL:url atomically:YES];
    } else {
        NSLog(@"Error saving new artist");
        return;
    }
    return;
}



- (IBAction)saveTapped:(id)sender {
  if (self.artist) {
        [self saveArtist:self.artist];
        [self.navigationController popToRootViewControllerAnimated:true];
    } else {
        NSLog(@"Invalid Arist");
    }
}


-(void)updateViews {
    if (!self.isViewLoaded || !self.artist) {return;}
    self.artistName.text = self.artist.artistName;
    self.bioTextView.text = self.artist.artistBio;
    self.yearFormed.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.artist.formedYear];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    
    
  [self.controller fetchArtistWithName:searchBar.text completionBlock:^(LSIArtist *receivedArtist, NSError *error) {
        if (error) {
            NSLog(@"Unable to fetch artist");
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.artist = receivedArtist;
                [self updateViews];
                
            });
        }
    }];
}

@end
