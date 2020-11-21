//
//  ArtistDetailVC.m
//  FavoriteArtists
//
//  Created by Cora Jacobson on 11/21/20.
//

#import "ArtistDetailVC.h"

@interface ArtistDetailVC ()

@property (nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) IBOutlet UILabel *artistNameLabel;
@property (nonatomic) IBOutlet UILabel *foundedLabel;
@property (nonatomic) IBOutlet UITextView *descriptionTextView;

@end

@implementation ArtistDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
}

- (IBAction)saveButton:(id)sender
{
    
}

@end
