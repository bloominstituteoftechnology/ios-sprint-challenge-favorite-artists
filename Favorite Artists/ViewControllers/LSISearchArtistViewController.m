//
//  LSISearchArtistViewController.m
//  Favorite Artists
//
//  Created by macbook on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSISearchArtistViewController.h"
#import "LSIArtist.h"
#import "LSIArtistController.h"

@interface LSISearchArtistViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *artistSearchBar;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;

@end

@implementation LSISearchArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)saveBarButtonTapped:(UIBarButtonItem *)sender {
}

- (void)updateViews {
    
    if (self.artist) {
        
        NSNumber *yearNumber = [NSNumber numberWithInt:self.artist.yearFormed];
        
        self.title = self.artist.name;
        self.nameLabel.text = self.artist.name;
        self.yearFormedLabel.text = yearNumber;
        self.bioTextView.text = self.artist.biography;
    } else {
        self.title = @"Search Artist";
    }
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
