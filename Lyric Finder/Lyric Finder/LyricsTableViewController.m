//
//  LyricsTableViewController.m
//  Lyric Finder
//
//  Created by Vuk Radosavljevic on 10/5/18.
//  Copyright © 2018 Vuk. All rights reserved.
//

#import "LyricsTableViewController.h"
#import "AddLyricsViewController.h"
#import "Song.h"
#import "SongController.h"

@interface LyricsTableViewController ()

@property SongController *songContrller;

@end

@implementation LyricsTableViewController


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _songContrller = [[SongController alloc] init];
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _songContrller = [[SongController alloc] init];
    }
    return self;
}



- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songContrller.songs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    Song *song = [self.songContrller.songs objectAtIndex:indexPath.row];
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = song.artist;
    
    return cell;
}





#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AddLyricsViewController *destinationVC = segue.destinationViewController;
    destinationVC.songController = self.songContrller;
    if ([segue.identifier  isEqualToString: @"ShowSong"]) {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        destinationVC.song = [self.songContrller.songs objectAtIndex:indexPath.row];
    }
}


@end
