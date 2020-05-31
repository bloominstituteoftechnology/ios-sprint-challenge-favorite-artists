//
//  DSCAddArtistViewController.m
//  FavoriteArtists
//
//  Created by denis cedeno on 5/29/20.
//  Copyright © 2020 DenCedeno Co. All rights reserved.
//

#import "DSCAddArtistViewController.h"
#import "DSCFetchArtist.h"
#import "DSCArtist.h"

@interface DSCAddArtistViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;

@end

@implementation DSCAddArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;
{
    NSString *searchedText = searchText;
    DSCFetchArtist *fetcher = [[DSCFetchArtist alloc]init];
    [fetcher fetchArtist:searchedText completion:^(DSCArtist * _Nullable artist, NSError * _Nullable error) {
        NSLog(@"Got this artist: %@", artist);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.artistNameLabel.text = artist.name;
            self.bioTextView.text = artist.biography;
            self.yearLabel.text = [NSString stringWithFormat:@"%d", artist.year];
        });
    }];
}

- (IBAction)saveButtonTapped:(id)sender {
    
}


@end
