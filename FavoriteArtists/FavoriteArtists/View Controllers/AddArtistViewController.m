//
//  AddArtistViewController.m
//  FavoriteArtists
//
//  Created by Cody Morley on 7/17/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

#import "AddArtistViewController.h"
#import <UIKit/UIKit.h>

@interface AddArtistViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;

@end

@implementation AddArtistViewController (UISearchBarDataSource)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)saveArtist:(id)sender {
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
