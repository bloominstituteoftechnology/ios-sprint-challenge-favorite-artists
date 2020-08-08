//
//  ArtistDetailViewController.m
//  Favorite Artist
//
//  Created by Gerardo Hernandez on 8/8/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "Artist.h"
#import "ArtistFetcher.h"
#import "FavoriteArtistController.h"

@interface ArtistDetailViewController ()

@property ArtistFetcher *artistFetcher;

// IBOutlets
@property (nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) IBOutlet UILabel *artistNameLabel;
@property (nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (nonatomic) IBOutlet UILabel *biogprahyLabel;


@end

@implementation ArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
