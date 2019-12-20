//
//  LSILyricFinderTableViewController.m
//  LSILyric FInder
//
//  Created by Iyin Raphael on 3/8/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSILyricFinderTableViewController.h"
#import "LSILyricsController.h"
#import "LSILyricFInderViewController.h"
#import "LSILyric.h"

@interface LSILyricFinderTableViewController ()

@property LSILyricsController *lyricsController;

@end

@implementation LSILyricFinderTableViewController


#pragma mark - Table view data source

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.lyricsController = [[LSILyricsController alloc] init];
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_lyricsController.lyricsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    LSILyric *song = [self.lyricsController.lyricsArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:song.title];
    [cell.detailTextLabel setText:song.artistName];

    return cell;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddSong"]) {
        LSILyricFInderViewController *detailVC = segue.destinationViewController;
        detailVC.lyricsController = self.lyricsController;
    } else if ([segue.identifier isEqualToString:@"showSong"]){
        LSILyricFInderViewController *detailVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        LSILyric *song = [self.lyricsController.lyricsArray objectAtIndex:[indexPath row]];
        [detailVC setSong:song];
        [detailVC setLyricsController:self.lyricsController];
    }
}

@end
