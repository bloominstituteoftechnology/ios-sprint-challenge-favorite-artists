//
//  EPWFavoriteArtistsTableViewController.m
//  Favorite-Artists Sprint
//
//  Created by Elizabeth Wingate on 4/17/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

#import "EPWFavoriteArtistsTableViewController.h"
#import "EPWArtist.h"
#import "EPWArtistController.h"

@interface EPWFavoriteArtistsTableViewController ()

@property (nonatomic) EPWArtistController *artistController;
@property NSMutableArray *favoritedArtists;

@end

@implementation EPWFavoriteArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *loadedArtists = [self.artistController fetchFavoritedArtists];

    self.favoritedArtists = [[NSMutableArray alloc] initWithArray:loadedArtists];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        _artistController = [[EPWArtistController alloc] init];
        _favoritedArtists = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.favoritedArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    // Configure the cell...
    EPWArtist *artist = self.favoritedArtists[indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in: %lu", (unsigned long)artist.formedYear];
    
    return cell;
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"DetailSegue" sender:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    if ([[segue identifier] isEqualToString:@"AddSegue"]) {
        
    // Pass the selected object to the new view controller.
      EPWAddSearchViewController *addVC = [segue destinationViewController];
            
        addVC.artistController = self.artistController;
        addVC.viewType = Search;
        addVC.delegate = self;
    }
    
     if ([[segue identifier] isEqualToString:@"DetailSegue"]) {
      EPWAddSearchViewController *detailVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            
        detailVC.artistController = self.artistController;
        detailVC.artist = [self.favoritedArtists objectAtIndex:indexPath.row];
        detailVC.viewType = Detail;
    }
}

- (void)didSave:(EPWArtist *)artist {
    [self.favoritedArtists addObject:artist];
    [self.tableView reloadData];
}

@end
