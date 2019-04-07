//
//  LAArtistTableViewController.m
//  LAFavoriteArtists
//
//  Created by Angel Buenrostro on 4/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

#import "LAArtistTableViewController.h"
#import "LAArtistController.h"
#import "LADetailViewController.h"

@interface LAArtistTableViewController ()
@property LAArtistController *artistController;
@property NSMutableArray *artistArray;
@property LAArtist *artistForSegue;
@end

@implementation LAArtistTableViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:true];
    // Initialize artistController
    if(!self.artistController){
        self.artistController = [[LAArtistController alloc]init];
        self.artistForSegue = [[LAArtist alloc]init];
    }
    // Clear array so no duplicates will be added to our tableView then fetch all saved artists and reload table
    [_artistArray removeAllObjects];
    self.artistArray = [self.artistController fetchAllSavedArtists];
    self.tableView.reloadData;
    
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
    
    LAArtist *artist = _artistArray[indexPath.row];
    cell.textLabel.text = artist.name;
    NSString *yearString = [NSString stringWithFormat:@"%d",artist.year];
    cell.detailTextLabel.text = yearString;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.artistForSegue = [_artistArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"showDetail" sender:self.artistForSegue];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"showDetail"]){
    LADetailViewController *detailVC = segue.destinationViewController;
    detailVC.artist = sender;
    }
}


@end
