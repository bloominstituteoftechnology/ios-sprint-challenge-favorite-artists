//
//  DBEFaveArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Dahna on 7/17/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

#import "DBEFaveArtistsTableViewController.h"
#import "DBEArtist.h"
#import "DBEArtistController.h"
#import "DBEShowSearchViewController.h"

@interface DBEFaveArtistsTableViewController ()

@property DBEArtistController *artistController;
@property NSMutableArray *artistArray;
@property DBEArtist *artist;

@end

@implementation DBEFaveArtistsTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];
    
    if (!self.artistController) {
        self.artistController = [[DBEArtistController alloc] init];
        self.artist = [[DBEArtist alloc] init];
    }
    [_artistArray removeAllObjects];
    self.artistArray = [self.artistController fetchAllFavoriteArtists];
    self.tableView.dataSource = self;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _artistArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    DBEArtist *artist = _artistArray[indexPath.row];
    cell.textLabel.text = artist.name;
    NSString *yearString = [NSString stringWithFormat:@"%d", artist.year];
    cell.detailTextLabel.text = yearString;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.artist = [_artistArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"ShowDetail" sender:self.artist];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"ShowDetail"]) {
        DBEShowSearchViewController *detailVC = (DBEShowSearchViewController *)segue.destinationViewController;
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        detailVC.artist = self.artistArray[path.row];
    }
}


@end
