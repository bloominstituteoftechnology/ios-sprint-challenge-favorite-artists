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
//@property (nonatomic) NSMutableArray<MBMArtist *> *artists;
@end

@implementation MBMArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _artistFetcher = [[ArtistFetcher alloc] init];
    
    _refreshController = [[UIRefreshControl alloc] init];
    [self.refreshController addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshController];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
//    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    NSLog(@"Count %lu", (unsigned long)_artistFetcher.artistsArray.count);
//    self.artists = self.artistFetcher.artistsArray;
//    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistFetcher.artistsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    MBMArtist *artist = self.artistFetcher.artistsArray[indexPath.row];
    cell.textLabel.text = artist.artistName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
    
    return cell;
}

-(void)handleRefresh : (id)sender {
    [self.tableView reloadData];
    NSLog (@"Pull To Refresh Method Called");
    [self.refreshController endRefreshing];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if([segue.identifier isEqualToString:@"ArtistSearchSegue"]){
        MBMArtistSearchViewController *search = (MBMArtistSearchViewController *)segue.destinationViewController;
        search.artistFetcher = _artistFetcher;
    }
    
//    if ([[segue identifier] isEqualToString:@"ArtistSearchSegue"]) {
//        // Get reference to the destination view controller
//        MBMArtistSearchViewController *artistSearchVC = [segue destinationViewController];
//
//        // Pass any objects to the view controller here, like...
//        [artistSearchVC setMyObjectHere:self.artistFetcher];
//    }
}


@end
