//
//  KRCDetailViewController.m
//  Favorite Artists
//
//  Created by Christopher Aronson on 7/19/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

#import "KRCDetailViewController.h"
#import "KRCArtistController.h"
#import "KRCArtist.h"

@interface KRCDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end

@implementation KRCDetailViewController

- (void)setArtistController:(KRCArtistController *)artistController {
    _artistController = artistController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self searchBar] setDelegate:self];
    
    if ([[self artist] artistName]) {
        [self setTitle:[[self artist] artistName]];
        [[self artistLabel] setText:[[self artist] artistName]];
        [[self bioTextView] setText:[[self artist] bio]];
        
        NSString *year = [NSString stringWithFormat:@"%lu",[[self artist] yearFormed]];
        
        [[self yearLabel] setText:year];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    NSLog(@"Starting search for: %@", [searchBar text]);
    
    [[self artistController] fetchArtistNamed:[searchBar text] completion:^(KRCArtist * _Nullable artist, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"%@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [[self artistLabel] setText:[artist artistName]];
            
            NSString *year = [NSString stringWithFormat:@"%lu", [artist yearFormed]];
            [[self yearLabel] setText:year];
            
            [[self bioTextView] setText:[artist bio]];
            
            [self setArtist:artist];
        });
        
    }];
    
    [searchBar setText:@""];
}

- (IBAction)saveButtonTapped:(id)sender {
    
    if (![self artist]) {
        return;
    }
    
    [[self artistController] addArtist:[self artist]];
    

    [[self artistController] saveToFIle];

    [[self navigationController] popToRootViewControllerAnimated:YES];
}

@end
