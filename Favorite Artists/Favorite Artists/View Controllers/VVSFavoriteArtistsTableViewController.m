//
//  VVSFavoriteArtistsTableViewController.m
//  Favorite Artists
//
//  Created by Vici Shaweddy on 2/9/20.
//  Copyright © 2020 Vici Shaweddy. All rights reserved.
//

#import "VVSFavoriteArtistsTableViewController.h"
#import "VVSArtist.h"
#import "VVSArtistController.h"

@interface VVSFavoriteArtistsTableViewController ()

@property (nonatomic, readonly) VVSArtistController *artistController;
@property NSMutableArray *favoritedArtists;

@end

@implementation VVSFavoriteArtistsTableViewController

// need this for the storyboard

- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super initWithCoder:coder]) {
        _artistController = [[VVSArtistController alloc] init];
        _favoritedArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *loadedArtists = [self.artistController fetchFavoritedArtists];
    
    // set favorite artists to loaded artists
    self.favoritedArtists = [[NSMutableArray alloc] initWithArray:loadedArtists];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.favoritedArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    VVSArtist *artist = self.favoritedArtists[indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in: %lu", (unsigned long)artist.formedYear];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"DetailSegue" sender:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"AddSegue"])
    {
        VVSAddSearchViewController *addVC = [segue destinationViewController];
        
        addVC.artistController = self.artistController;
        addVC.viewType = Search;
        addVC.delegate = self;
    }
    
    if ([[segue identifier] isEqualToString:@"DetailSegue"])
    {
        VVSAddSearchViewController *detailVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        detailVC.artistController = self.artistController;
        detailVC.artist = [self.favoritedArtists objectAtIndex:indexPath.row];
        detailVC.viewType = Detail;
    }
}

- (void)didSave:(VVSArtist *)artist {
    [self.favoritedArtists addObject:artist];
    [self.tableView reloadData];
}

@end
