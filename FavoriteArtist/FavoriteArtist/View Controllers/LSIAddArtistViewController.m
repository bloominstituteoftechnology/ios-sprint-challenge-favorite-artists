//
//  LSIAddArtistViewController.m
//  FavoriteArtist
//
//  Created by Lambda_School_Loaner_214 on 11/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "LSIAddArtistViewController.h"

@interface LSIAddArtistViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameTF;
@property (weak, nonatomic) IBOutlet UILabel *formedInTF;
@property (weak, nonatomic) IBOutlet UITextView *bioTV;

@end

@implementation LSIAddArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
}

- (IBAction)saveTapped:(id)sender {
}
@end
