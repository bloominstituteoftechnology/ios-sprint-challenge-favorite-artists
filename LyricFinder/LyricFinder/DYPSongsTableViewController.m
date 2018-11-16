
//
//  DYPSongsTableViewController.m
//  LyricFinder
//
//  Created by Daniela Parra on 11/16/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

#import "DYPSongsTableViewController.h"
#import "DYPSongController.h"
#import "DYPSong.h"
#import "DYPSongDetailViewController.h"

@interface DYPSongsTableViewController ()

@property (nonatomic) DYPSongController *songController;

@end

@implementation DYPSongsTableViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _songController = [[DYPSongController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _songController = [[DYPSongController alloc] init];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songController.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    DYPSong *song = [self.songController.songs objectAtIndex:[indexPath row]];
    
    [cell.textLabel setText:song.title];
    [cell.detailTextLabel setText:song.artistName];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ViewSong"]) {
        DYPSongDetailViewController *destinationVC = (DYPSongDetailViewController *)[segue destinationViewController];
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DYPSong *song = [self.songController.songs objectAtIndex:[indexPath row]];
        [destinationVC setSong:song];
        [destinationVC setSongController:self.songController];
    } else if ([segue.identifier isEqualToString:@"AddSong"]) {
        DYPSongDetailViewController *destinationVC = (DYPSongDetailViewController *)[segue destinationViewController];
        
        [destinationVC setSongController:self.songController];
    }
}

@end
