//
//  LSIDetailViewController.m
//  FaveArtists
//
//  Created by John Pitts on 7/19/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

#import "LSIDetailViewController.h"

@interface LSIDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *artistSearchBar;

@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFoundedLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;


@end

@implementation LSIDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self updateViews]
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
}

- (IBAction)saveButtonTapped:(id)sender {
    
    // initialize an Artist Model with data from 3 Outlets
    
    // add Artist to bands array to persist
    
}




@end
