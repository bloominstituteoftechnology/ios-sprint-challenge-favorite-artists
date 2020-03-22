//
//  MBMArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Michael on 3/20/20.
//  Copyright © 2020 Michael. All rights reserved.
//

#import "MBMArtistsTableViewController.h"
#import "MBMArtistSearchViewController.h"
#import "MBMArtist.h"
#import "ArtistFetcher.h"

@interface MBMArtistsTableViewController ()

@property (nonatomic, strong) ArtistFetcher *artistFetcher;
@property (nonatomic, strong) UIRefreshControl *refreshController;

@end

@implementation MBMArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _artistFetcher = [[ArtistFetcher alloc] init];
    
    _refreshController = [[UIRefreshControl alloc] init];
    [self.refreshController addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshController];
    
    [self.artistFetcher loadFromPersistentStore];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistFetcher.artistsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    MBMArtist *artist = self.artistFetcher.artistsArray[indexPath.row];
    cell.textLabel.text = artist.artistName;
    if (!artist.yearFormed) {
        cell.detailTextLabel.text = @"Formed in: N/A";
    } else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in: %d", artist.yearFormed];
    }
    
    
    return cell;
}

-(void)handleRefresh : (id)sender {
    [self.tableView reloadData];
    NSLog (@"Pull To Refresh Method Called");
    [self.refreshController endRefreshing];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        MBMArtist *artist = self.artistFetcher.artistsArray[indexPath.row];
        [self.artistFetcher.artistsArray removeObject:artist];
        [self.artistFetcher saveToPersistentStore];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }   
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if([segue.identifier isEqualToString:@"ArtistSearchSegue"]){
        MBMArtistSearchViewController *search = (MBMArtistSearchViewController *)segue.destinationViewController;
        search.artistFetcher = _artistFetcher;
    } else if ([segue.identifier isEqualToString:@"ArtistDetailSegue"]) {
        MBMArtistSearchViewController *detail = (MBMArtistSearchViewController *)segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MBMArtist *artist = self.artistFetcher.artistsArray[indexPath.row];
        detail.artist = artist;
    }
}

@end
