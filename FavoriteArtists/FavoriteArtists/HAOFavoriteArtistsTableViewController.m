//
//  HAOFavoriteArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Hunter Oppel on 6/12/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

#import "HAOFavoriteArtistsTableViewController.h"
#import "HAOArtistViewController.h"
#import "HAOArtist.h"

@interface HAOFavoriteArtistsTableViewController () <UITableViewDelegate, UITableViewDataSource, HAOArtistViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray<HAOArtist *> *favoriteArtists;

@end

@implementation HAOFavoriteArtistsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.favoriteArtists = [[NSMutableArray<HAOArtist *> alloc] init];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}

// MARK: - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"AddNewArtistSegue"]) {
        HAOArtistViewController *detailVC = segue.destinationViewController;

        detailVC.delegate = self;
    } else if ([segue.identifier isEqualToString:@"DisplayArtistSegue"]) {
        HAOArtistViewController *detailVC = segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        
        detailVC.artist = self.favoriteArtists[indexPath.row];
    }
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.favoriteArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    HAOArtist *artist = self.favoriteArtists[indexPath.row];
    
    cell.textLabel.text = artist.artistName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
    
    return cell;
}

// MARK: - HAOArtistViewDelegate

- (void)didSaveArtist:(HAOArtist *)artist
{
    NSLog(@"%@", artist);
    [self.favoriteArtists addObject:artist];
    NSLog(@"%@", self.favoriteArtists);
}

@end
