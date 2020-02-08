//
//  JDKFavoriteArtistsTableViewController.m
//  FavoriteArtist
//
//  Created by John Kouris on 2/8/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

#import "JDKFavoriteArtistsTableViewController.h"
#import "JDKArtistController.h"
#import "JDKShowArtistDetailsViewController.h"
#import "JDKAddArtistViewController.h"

@interface JDKFavoriteArtistsTableViewController ()

@property JDKArtistController *artistController;
@property NSMutableArray *artistArray;
@property JDKArtist *artist;

@end

@implementation JDKFavoriteArtistsTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!self.artistController) {
        self.artistController = [[JDKArtistController alloc] init];
        self.artist = [[JDKArtist alloc] init];
    }
    
    [self.artistArray removeAllObjects];
    self.artistArray = [self.artistController fetchAllSavedArtists];
    
    NSLog(@"%lu", (unsigned long)self.artistArray.count);
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    JDKArtist *artist = self.artistArray[indexPath.row];
    cell.textLabel.text = artist.name;
    
    NSString *yearFormed = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
    cell.detailTextLabel.text = yearFormed;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        JDKAddArtistViewController *destinationVC = segue.destinationViewController;
    } else if ([segue.identifier isEqualToString:@"ShowArtistDetailSegue"]) {
        JDKShowArtistDetailsViewController *destinationVC = segue.destinationViewController;
    }
}


@end
