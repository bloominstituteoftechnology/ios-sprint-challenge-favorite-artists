//
//  SLRTableViewController.m
//  FavoriteArtists
//
//  Created by Sameera Roussi on 7/19/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

#import "SLRTableViewController.h"
#import "SLRDetailViewController.h"
#import "SLRFetchArtist.h"
#import "SLRArtist.h"

@interface SLRTableViewController ()

@property NSMutableArray *tempArtistArray;
@property SLRFetchArtist *fetchArtist;

@end

@implementation SLRTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.fetchArtist = [[SLRFetchArtist alloc] init];
    }
    return self;
}

#pragma mark - View states

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self tableView] reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (!self.fetchArtist) {
        self.fetchArtist = [[SLRFetchArtist alloc] init];
        self.artist = [[SLRArtist alloc] init];
    }
    [self.tempArtistArray removeAllObjects];
    self.tempArtistArray = [self.fetchArtist artistArray];
    [self.tableView reloadData];
    

}



#pragma mark - Table view data source

// Number of rows in section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tempArtistArray.count;
}


// Cell for row at
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TheCell" forIndexPath:indexPath];
    
    SLRArtist *artist = self.tempArtistArray[indexPath.row];
    
    //NSString *yearFormedString = [NSString stringWithFormat:@"First appeared in %d", artist.yearFormed];
    
    // Get the value for the subtitle (yearFormed)
    NSString *yearFormedString = @"";
    if(artist.yearFormed == 0) {
        yearFormedString =  [NSString stringWithFormat:@"Year first appeared not available at this time."];
    } else {
        yearFormedString = [NSString stringWithFormat:@"First appeared in %d", artist.yearFormed];
    }
    
  //  NSString *yearFormedString = [NSString stringWithFormat:@"First appeared in %d", artist.yearFormed];
    
    cell.textLabel.text = artist.artistName;
    cell.detailTextLabel.text = yearFormedString;
    
    return cell;
}


// Delete functionality
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SegueToAddArtist"]) {
        SLRDetailViewController *detailVC = [segue destinationViewController];
        detailVC.fetchartist = self.fetchArtist;
    } else {
        SLRDetailViewController *detailVC = [segue destinationViewController];
        NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
        detailVC.fetchedArtist = [self tempArtistArray][indexPath.row];
    }
}


@end
