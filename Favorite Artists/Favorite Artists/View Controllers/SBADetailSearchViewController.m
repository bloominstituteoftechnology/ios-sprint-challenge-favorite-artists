//
//  SBADetailSearchViewController.m
//  Favorite Artists
//
//  Created by Sal B Amer on 5/29/20.
//  Copyright © 2020 Sal B AmerDEv. All rights reserved.
//

#import "SBADetailSearchViewController.h"
#import "SBAArtistModelController.h"
#import "SBAArtist.h"

// add search bar delegate
@interface SBADetailSearchViewController () <UISearchBarDelegate>

@property (nonatomic) SBAArtist *artistResult;

//MARK Outlets
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistName;
@property (weak, nonatomic) IBOutlet UILabel *artistFormationLbl;
@property (weak, nonatomic) IBOutlet UITextView *artistBioTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveBtn;

//Mark Action
- (IBAction)saveButtnPressed:(UIBarButtonItem *)sender;

@end


@implementation SBADetailSearchViewController

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

- (IBAction)saveButtnPressed:(id)sender {
  if (self.artistResult) {
    [self.artistController.favoriteArtists addObject:self.artistResult];
    [self.navigationController popToRootViewControllerAnimated:true];
  }
  
}
@end
