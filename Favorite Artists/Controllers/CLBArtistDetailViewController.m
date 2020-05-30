//
//  CLBArtistDetailViewController.m
//  Favorite Artists
//
//  Created by Christian Lorenzo on 5/30/20.
//  Copyright © 2020 Christian Lorenzo. All rights reserved.
//

#import "CLBArtistDetailViewController.h"
#import "CLBArtists.h"
#import "CLBArtistsController.h"
#import "CLBArtist+NSJSONSerialization.h"

@interface CLBArtistDetailViewController ()<UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormed;
@property (strong, nonatomic) IBOutlet UITextView *boigraphyTextView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (nonatomic) CLBArtists *artistSearch;
@property (nonatomic) BOOL isArtist;

@end

@implementation CLBArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
    
    if (self.artist == nil) {
        self.isArtist = NO;
    } else {
        self.isArtist = YES;
        [self updateViews];
    }
}

- (void)updateViews {
    
    if (self.isArtist == YES) {
        self.searchBar.hidden = YES;
        self.title = self.artist.artist;
        
        self.artistLabel.hidden = NO;
        self.yearFormed.hidden = NO;
        self.boigraphyTextView.hidden = NO;
        
        self.artistLabel.text = self.artist.artist;
        
        if (self.artist.yearFormed == 0) {
            self.yearFormed.text = @"N/A";
        } else {
            self.yearFormed.text = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
        }
        
        self.boigraphyTextView.text = self.artist.biography;
        
    } else {
        self.artistLabel.hidden = NO;
        self.yearFormed.hidden = NO;
        self.boigraphyTextView.hidden = NO;
        
        self.artistLabel.text = self.artistSearch.artist;
        
        if (self.artistSearch.yearFormed == 0) {
            self.yearFormed.text = @"N/A";
        } else {
            self.yearFormed.text = [NSString stringWithFormat:@"Formed in %d", self.artistSearch.yearFormed];
        }
        
        self.boigraphyTextView.text = self.artistSearch.biography;
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.artistController fetchArtistsWithName:searchBar.text completion:^(CLBArtists * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist!");
        }
        
        NSLog(@"Fetched artist: %@", artist);
        self.artistSearch = artist;
        
        dispatch_async(dispatch_get_main_queue(), ^ {
            [self updateViews];
        });
    }];
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    
    if (self.artistSearch == nil) {
        return;
    }
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:[self.artistSearch toDictionary] options:0 error:nil];
    NSURL *directory = [[NSFileManager defaultManager] URLForDirectory: NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    
    NSURL *url = [[directory URLByAppendingPathComponent:self.artistSearch.artist] URLByAppendingPathExtension:@"json"];
    
    NSLog(@"Directory: %@", directory);
    NSLog(@"UR: %@", url);
    
    [data writeToURL:url atomically:YES];
    
    [self.navigationController popToRootViewControllerAnimated:true];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
