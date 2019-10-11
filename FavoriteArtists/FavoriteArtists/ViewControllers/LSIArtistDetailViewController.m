//
//  LSIArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Luqmaan Khan on 10/11/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

#import "LSIArtistDetailViewController.h"

@interface LSIArtistDetailViewController ()
@property (strong, nonatomic) IBOutlet UISearchBar *artistSearchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistName;
@property (strong, nonatomic) IBOutlet UILabel *yearFormed;
@property (strong, nonatomic) IBOutlet UITextView *bioTextView;

@end

@implementation LSIArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)saveTapped:(id)sender {
}


@end
