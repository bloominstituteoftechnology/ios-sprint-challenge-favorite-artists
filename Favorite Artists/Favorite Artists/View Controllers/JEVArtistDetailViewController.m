//
//  JEVArtistDetailViewController.m
//  Favorite Artists
//
//  Created by Joe Veverka on 7/18/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

#import "JEVArtistDetailViewController.h"
#import "JEVArtistController.h"
#import "JEVArtist+JSONSerialization.h"


@interface JEVArtistDetailViewController ()

//MARK: - IBOutlets
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation JEVArtistDetailViewController

//MARK: - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    self.searchBar.delegate = self;
    [self.saveButton setEnabled:false];
}

- (IBAction)saveArtist:(id)sender {
    
    if (self.artist)
        
    {
        
        [self.controller addArtist:self.artist];
        
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)setArtist
{
    self.title = self.artist.name;
    self.nameLabel.text = self.artist.name;
    
    if (self.artist.year == 0)
        
    {
        
        self.yearLabel.text = @"Cannot Find Year Formed";
        
    }
    
    else
        
    {
        self.yearLabel.text = [NSString stringWithFormat:@"Formed in %lu", self.artist.year];
    }
    
    self.biographyLabel.text = self.artist.biography;
    [self.saveButton setEnabled:true];
}

- (void) updateViews
{
    if (self.artist)
    {
        [self setArtist];
        [self.searchBar setHidden:true];
        self.navigationItem.rightBarButtonItem.enabled = false;
    } else
    {
        self.title = @"New Artist";
        self.nameLabel.text = @"";
        self.yearLabel.text = @"";
        self.biographyLabel.text = @"";
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.controller findArtistWithName:searchBar.text completion:^(JEVArtist *artist) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.artist = artist;
            
            if (artist)
                
            {
                [self setArtist];
                
            }
            
            else
                
            {
                
                self.nameLabel.text = [NSString stringWithFormat:@"Could Not find %@. \nTry Again.", searchBar.text];
                self.yearLabel.text = @"";
                self.biographyLabel.text = @"";
            }
        });
    }];
}
@end
