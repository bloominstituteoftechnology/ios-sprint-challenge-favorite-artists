//
//  ArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Kelson Hartle on 8/2/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "LSIArtist.h"
#import "LSIArtistController.h"
#import "LSIArtist+NSJSONSerialization_.h"


@interface ArtistDetailViewController ()

@property (nonatomic) BOOL hasArtist;
@property (weak, nonatomic) IBOutlet UISearchBar *searchForArtistBar;
@property (weak, nonatomic) IBOutlet UITextView *artistDetailTextView;

-(void)updateViews;

@end

@implementation ArtistDetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.artist == nil) {
        self.hasArtist = NO;
        self.artistDetailTextView.text = @"";
    } else {
        self.hasArtist = YES;
        [self updateViews];
    }
    NSLog(@"Hey artist!");

}

- (void)updateViews {
    
    if (self.hasArtist == YES) {
        
        [self.searchForArtistBar setHidden:YES];
        self.title = self.artist.artistName;
        self.artistDetailTextView.text = self.artist.biography;
    
    } else {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                self.artistDetailTextView.text = self.artist.biography;
            });
        });
    }
}


- (IBAction)searchArtistTapped:(id)sender {
    NSLog(@"SearchTapped");
    [self.fetcher fetchArtistsWithArtistName:self.searchForArtistBar.text completionBlock:^(LSIArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist Error: %@", error);
            return;
        }
        self.artist = artist;
        NSLog(@"Artist: %@", artist.artistName);
        [self updateViews];
    }];
}

- (IBAction)saveArtistTapped:(id)sender {
    if (self.artist) {
        
        NSData *data = [NSJSONSerialization dataWithJSONObject:[self.artist toDictionary ] options:0 error:nil];
        
        NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        NSURL *url = [[directory URLByAppendingPathComponent:self.artist.artistName] URLByAppendingPathExtension: @"json"];
        
        NSLog(@"DIRECTORY: %@", directory);
        NSLog(@"URL: %@", url);
        
        [data writeToURL:url atomically:YES];
    }
    [self.navigationController popViewControllerAnimated:YES];
}







@end
