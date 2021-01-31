//
//  DetailVC.m
//  FavArtist
//
//  Created by Norlan Tibanear on 1/27/21.
//

#import "DetailVC.h"
#import "Artist.h"
#import "ArtistController.h"

@interface DetailVC ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *introLabel;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end

@implementation DetailVC

@synthesize artistController;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
    [self updateView];
}//


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchArtist = searchBar.text;

    [self.artistController searchArtist:searchArtist completion:^(Artist *artist, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Artist: %@, Error: %@", artist.artistName, error);
            self.artist = artist;
            [self updateView];
        });
        
    }];
    
}//



- (void)updateView {
    if (self.artist) {
        self.nameLabel.text = self.artist.artistName;
        self.introLabel.text = self.artist.biography;
        
        if (self.artist.formedYear > 0) {
            self.dateLabel.text = [NSString stringWithFormat:@"%d", self.artist.formedYear];
        } else {
            self.dateLabel.text = @"Year unknown";
        }
    }
    
}//




- (IBAction)saveButton:(id)sender {
    if (self.artist) {
        NSLog(@"saveTapped");
        [self.artistController addArtist:self.artist];
        [self.navigationController popViewControllerAnimated:true];
    }
}


@end
