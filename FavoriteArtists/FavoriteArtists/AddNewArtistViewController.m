//
//  AddNewArtistViewController.m
//  FavoriteArtists
//
//  Created by Sean Acres on 8/2/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

#import "AddNewArtistViewController.h"

@interface AddNewArtistViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistFormationDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistBiographyLabel;

@end

@implementation AddNewArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)saveArtistTapped:(id)sender {
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
