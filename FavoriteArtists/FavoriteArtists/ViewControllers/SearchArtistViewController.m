//
//  SearchArtistViewController.m
//  FavoriteArtists
//
//  Created by Bhawnish Kumar on 6/12/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

#import "SearchArtistViewController.h"
#import "NSJSONSerialization+LSIArtist.h"

@interface SearchArtistViewController ()

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistName;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *biographyTextView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButtonOutlet;
@property (nonatomic) LSIArtist *artistSearch;
@property (nonatomic) BOOL isArtist;

@end

@implementation SearchArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.artist == nil) {
        self.isArtist = NO;
    } else {
        self.isArtist = YES;
        [self updateViews];
    }
    
    self.searchBar.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)updateViews {
    if (self.isArtist == YES) {
           self.searchBar.hidden = YES;
           self.title = self.artist.artist;
           
           self.artistName.hidden = NO;
           self.yearFormedLabel.hidden = NO;
           self.biographyTextView.hidden = NO;
           
           self.artistName.text = self.artist.artist;

           if (self.artist.yearFormed == 0) {
               self.yearFormedLabel.text = @"N/A";
           } else {
               self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
           }
           self.biographyTextView.text = self.artist.biography;
       } else {
           self.artistName.hidden = NO;
           self.yearFormedLabel.hidden = NO;
           self.biographyTextView.hidden = NO;
           
           self.artistName.text = self.artistSearch.artist;

           if (self.artistSearch.yearFormed == 0) {
               self.yearFormedLabel.text = @"N/A";
           } else {
               self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %d", self.artistSearch.yearFormed];
           }
           self.biographyTextView.text = self.artistSearch.biography;
       }
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
     if (self.artistSearch == nil) {
           return;
       }
       
       NSData *data = [NSJSONSerialization dataWithJSONObject: [self.artistSearch withDictionary] options:0 error:nil];
       NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
       NSURL *url = [[directory URLByAppendingPathComponent:self.artistSearch.artist] URLByAppendingPathExtension: @"json"];
       
       NSLog(@"DIRECTORY: %@", directory);
       NSLog(@"URL: %@", url);

       [data writeToURL:url atomically:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.artistController fetchArtistName:searchBar.text completionHandler:^(LSIArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Fetching Error: ");
            return;
        }
        
        NSLog(@"Fetched artist: %@", artist);
        self.artistSearch = artist;

        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateViews];
        });
    }];
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
