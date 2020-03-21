//
//  MBMArtistSearchViewController.m
//  FavoriteArtists
//
//  Created by Michael on 3/20/20.
//  Copyright © 2020 Michael. All rights reserved.
//

#import "MBMArtistSearchViewController.h"
#import "MBMArtistResults.h"
#import "MBMArtist.h"
#import "ArtistFetcher.h"

@interface MBMArtistSearchViewController () <UISearchBarDelegate>

// MARK: - Properties

@property (nonatomic) MBMArtist *artist;

// MARK: - IBOutlets

@property (strong, nonatomic) IBOutlet UISearchBar *artistSearchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *artistBiographyTextView;


@end

@implementation MBMArtistSearchViewController

@synthesize artistFetcher;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.artistSearchBar.delegate = self;
    
}



// MARK: - IBActions
- (IBAction)saveTapped:(id)sender {
    [self.artistFetcher.artistsArray addObject:self.artist];
//    NSLog(@"SearchVC Count: %lu", self.artistFetcher.artistsArray.count);
//    NSLog(@"Artist: %@", self.artist);
//    [self.artistFetcher saveToPersistentStore];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [self.artistFetcher searchArtistsWithArtistName:self.artistSearchBar.text completionBlock:^(NSArray<MBMArtist *> * _Nullable artists, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (artists.firstObject == nil) {
            } else {
                
            self.artistNameLabel.text = artists.firstObject.artistName;
            NSLog(@"Artist Name: %@", artists.firstObject.artistName);
                if (artists.firstObject.yearFormed == nil) {
//                self.yearFormedLabel.text = @"Nah son we ain't got it";
                self.yearFormedLabel.text = @"Formed in: N/A";
            } else {
                self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in: %d", artists.firstObject.yearFormed];
            }
            self.artistBiographyTextView.text = artists.firstObject.artistBiography;
            self.artist = artists.firstObject;
//            NSLog(@"Name: %@", self.artist.artistName);
            }
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
