//
//  ArtistDetailViewController.m
//  Art
//
//  Created by Nick Nguyen on 4/17/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

#import "ArtistDetailViewController.h"

@interface ArtistDetailViewController ()

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *biographyTextView;


@end

@implementation ArtistDetailViewController


- (IBAction)savePressed:(UIBarButtonItem *)sender {
    
}








- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar becomeFirstResponder];
}



@end
