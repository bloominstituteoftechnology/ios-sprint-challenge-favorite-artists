//
//  BRDArtistViewController.m
//  My Favorite Artist
//
//  Created by Bradley Diroff on 6/12/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

#import "BRDArtistViewController.h"
#import "BRDArtistController.h"
#import "BRDArtist.h"
#import "BRDArtist+NSJSONSerialization.h"

@interface BRDArtistViewController ()<UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *biographyTextView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (nonatomic) BRDArtist *artistSearch;
@property (nonatomic) BOOL isArtist;

@end

@implementation BRDArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.searchBar.delegate = self;
    
    if (self.artist == nil) {
        self.isArtist = NO;
    } else {
        self.isArtist = YES;
        [self updateViews];
    }
    
    if (self.artistController == nil) {
        NSLog(@"There's NO controller");
    } else {
        NSLog(@"There's a controller");
    }
    
}

- (void)updateViews {
    if (self.isArtist == YES) {
        self.searchBar.hidden = YES;
        self.title = self.artist.artist;
        
        self.nameLabel.hidden = NO;
        self.yearFormedLabel.hidden = NO;
        self.biographyTextView.hidden = NO;
        
        self.nameLabel.text = self.artist.artist;
        
        if (self.artist.yearFormed == 0) {
            self.yearFormedLabel.text = @"N/A";
        } else {
            self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
        }
        self.biographyTextView.text = self.artist.biography;
    } else {
        self.nameLabel.hidden = NO;
        self.yearFormedLabel.hidden = NO;
        self.biographyTextView.hidden = NO;
        
        self.nameLabel.text = self.artistSearch.artist;
        
        if (self.artistSearch.yearFormed == 0) {
            self.yearFormedLabel.text = @"N/A";
        } else {
            self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %d", self.artistSearch.yearFormed];
        }
        self.biographyTextView.text = self.artistSearch.biography;
    }
}
    
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    NSLog(@"You hit return");
    
    [self.artistController fetchArtistWithName:searchBar.text completionBlock:^(BRDArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Fetching Error: ");
            return;
        }
        
        NSLog(@"Artist: %@", artist);
        self.artistSearch = artist;

        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateViews];
        });
    }];
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    if (self.artistSearch == nil) {
        return;
    }
    
    NSData *data = [NSJSONSerialization dataWithJSONObject: [self.artistSearch toDictionary] options:0 error:nil];
    NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    NSURL *url = [[directory URLByAppendingPathComponent:self.artistSearch.artist] URLByAppendingPathExtension: @"json"];
    
    NSLog(@"DIRECTORY: %@", directory);
    NSLog(@"URL: %@", url);

    [data writeToURL:url atomically:YES];
}

@end
