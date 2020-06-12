//
//  SearchArtistViewController.m
//  FavoriteArtists
//
//  Created by Bhawnish Kumar on 6/12/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

#import "SearchArtistViewController.h"

@interface SearchArtistViewController ()

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistName;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *biographyTextView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButtonOutlet;

@end

@implementation SearchArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
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
