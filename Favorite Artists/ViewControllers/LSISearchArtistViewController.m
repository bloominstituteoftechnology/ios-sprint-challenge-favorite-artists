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
    
    NSString *name = self.nameLabel.text;
    NSString *bio = self.bioTextView.text;
    NSString *yearString = self.yearFormedLabel.text;
    int yearInt = [yearString integerValue];

    
    if (self.artist) {
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } else {
        
        [self.artistController AddArtistWithName:name biography:bio yearFormed:yearInt];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
