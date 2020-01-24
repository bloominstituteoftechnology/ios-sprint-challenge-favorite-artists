//
//  JBDetailViewController.m
//  Unit4Sprint2Challenge
//
//  Created by Jon Bash on 2020-01-24.
//  Copyright © 2020 Jon Bash. All rights reserved.
//

#import "JBDetailViewController.h"
#import "JBArtist.h"
#import "JBArtistController.h"

@interface JBDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioView;

- (void)updateViews;
- (void)searchForArtist:(NSString *)artistName;

@end

@implementation JBDetailViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self updateViews];
    self.searchBar.delegate = self;
    [self.searchBar setHidden:!self.willSearch];
    self.title = (self.willSearch) ? @"New artist" : self.artist.name;

    if (self.willSearch)
    {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                                  initWithTitle:@"Save"
                                                  style:UIBarButtonItemStyleDone
                                                  target:self
                                                  action:NSSelectorFromString(@"saveArtistToFavorites")];
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
    }
    else
    {
        [self.nameLabel setHidden:YES];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (self.willSearch) { [self.searchBar becomeFirstResponder]; }
}

- (void)updateViews
{
    if (self.artist)
    {
        [self.navigationItem.rightBarButtonItem setEnabled:YES];
        self.nameLabel.text = self.artist.name;
        self.yearLabel.text = self.artist.originYearText;
        self.bioView.text = self.artist.biography;
    }
    else
    {
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
        self.nameLabel.text = @"";
        self.yearLabel.text = @"";
        self.bioView.text = @"";
    }
}

# pragma mark - Main Methods

- (void)searchForArtist:(NSString *)artistName
{
    self.artist = nil;
    [self.artistController fetchArtistWithName:artistName
                                    completion:^(JBArtist *artist,
                                                 NSError *error)
    {
        if (error)
        {
            NSLog(@"Error: %@", error);
            return;
        }
        if (artist)
        {
            self.artist = artist;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateViews];
            });
        }
        else
        {
            self.artist = nil;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateViews];
                self.nameLabel.text = @"No results found";
            });
        }
    }];
    [self updateViews];
}

- (void)saveArtistToFavorites
{
    [self.artistController addArtist:self.artist];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Search Bar Delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [self searchForArtist:searchBar.text];
}

@end
