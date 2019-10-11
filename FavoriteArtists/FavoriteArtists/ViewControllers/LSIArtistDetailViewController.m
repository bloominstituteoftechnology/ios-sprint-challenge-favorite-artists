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



- (IBAction)saveTapped:(id)sender {
    
    if (self.artist) {
        //update
        [self.controller update:self.artist withArtistName:self.artistName.text biography:self.bioTextView.text formedYear: [self.yearFormed.text intValue]];
    } else {
        //save with persistence
        
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
