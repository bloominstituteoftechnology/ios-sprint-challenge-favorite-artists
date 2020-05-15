//
//  ArtistViewController.m
//  Favorite Artists
//
//  Created by Wyatt Harrell on 5/15/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

#import "ArtistViewController.h"
#import "WAHArtistController.h"

@interface ArtistViewController ()

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *biographyTextView;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.artistController fetchArtistWithName:@"macklemore" completionBlock:^(WAHArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Fetching Error: %@", error);
            return;
        }
        
        NSLog(@"Fetched artist: %@", artist);
    
    }];

    NSLog(@"herer");

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
}


@end
