//
//  DSCAddArtistViewController.m
//  FavoriteArtists
//
//  Created by denis cedeno on 5/29/20.
//  Copyright © 2020 DenCedeno Co. All rights reserved.
//

#import "DSCAddArtistViewController.h"
#import "DSCFetchArtist.h"
#import "DSCArtist.h"
#import "DSCArtistController.h"
#import "DSCArtist+_NSJSONSerialization.h"

@interface DSCAddArtistViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveBarButton;

@end

@implementation DSCAddArtistViewController

- (DSCArtistController *)aController {
    if (!_aController) {
        _aController = [[DSCArtistController alloc]init];
    }
    return _aController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
    [self loadViews];
}

- (void)loadViews {
    if (self.artist) {
        self.searchBar.hidden = YES;
        self.saveBarButton.enabled = NO;
        self.title = self.artist.name;
        self.artistNameLabel.text = self.artist.name;
        self.bioTextView.text = self.artist.biography;
        self.yearLabel.text = [NSString stringWithFormat:@"Formed In %d", self.artist.year];
    } else {
        [self updateViews];
    }
}
-(void)updateViews {
    self.title = @"Add New Artist";
    self.artistNameLabel.text = self.artist.name;
    self.bioTextView.text = self.artist.biography;
    if (self.artist) {
        self.yearLabel.text = [NSString stringWithFormat:@"Formed In %d", self.artist.year];
    } else {
        self.yearLabel.text = @"";
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
{
    NSString *searchedText = searchBar.text;
    DSCFetchArtist *fetcher = [[DSCFetchArtist alloc]init];
    [fetcher fetchArtist:searchedText completion:^(DSCArtist * _Nullable artist, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.artist = artist;
            [self updateViews];
        });
    }];
}

- (IBAction)saveButtonTapped:(id)sender {
    
    if (self.artist == nil)
    {
        return;
    }
    
    [self.aController saveArtist: self.artist];
    [self.navigationController popViewControllerAnimated:true];
    
}
@end
