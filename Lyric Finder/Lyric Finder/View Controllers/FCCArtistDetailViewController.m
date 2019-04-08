//
//  FCCArtistDetailViewController.m
//  Lyric Finder
//
//  Created by Lambda_School_Loaner_34 on 4/5/19.
//  Copyright © 2019 Frulwinn. All rights reserved.
//

#import "FCCArtistDetailViewController.h"
#import "FCCArtistController.h"
#import "FCCArtist.h"

@interface FCCArtistDetailViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation FCCArtistDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateViews];
    self.searchBar.delegate = self;
    
}

- (IBAction)save:(id)sender
{
    NSString *artist = self.artistLabel.text;
    NSInteger year = (int)self.yearLabel.text;
    NSString *biography = self.biographyTextView.text;
    
    [self.artistController createFavoriteWithArtist:artist year:year biography:biography];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *artist = self.searchBar.text;
    
    [self.artistController fetchWithArtist:artist completion:^(NSError * _Nonnull error)];
    
}

- (void)updateViews
{
    
    if (!self.isViewLoaded || !self.artist) { return; }
    self.title = self.artist.artist;
    
    self.artistLabel.text = self.artist.artist;
    self.yearLabel.text = [NSString stringWithFormat:@"Formed in %ld"];
    self.biographyTextView.text = self.artist.biography;
    
    self.navigationItem.rightBarButtonItem = nil;
    [self.searchBar removeFromSuperview];
}


@end
