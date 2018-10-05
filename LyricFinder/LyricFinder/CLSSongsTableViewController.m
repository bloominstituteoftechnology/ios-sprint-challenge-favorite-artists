//
//  CLSSongsTableViewController.m
//  LyricFinder
//
//  Created by Carolyn Lea on 10/5/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

#import "CLSSongsTableViewController.h"
#import "CLSSongController.h"
#import "Song.h"
#import "CLSDetailViewController.h"

@interface CLSSongsTableViewController ()

@property Song *song;
@property CLSSongController *songController;

@end

@implementation CLSSongsTableViewController

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _song = [[Song alloc] init];
    _songController = [[CLSSongController alloc] init];
    self.title = @"Song List";
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.songController.songs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    _song = _songController.songs[indexPath.row];
    cell.textLabel.text = _song.artist;
    cell.detailTextLabel.text = _song.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation
//ShowAddView, ShowDetailView

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CLSDetailViewController *detailView = segue.destinationViewController;
    
    if([segue.identifier isEqualToString:@"ShowAddView"])
    {
        detailView.songController = self.songController;
    }
    else if([segue.identifier isEqualToString:@"ShowDetailView"])
    {
        detailView.songController = self.songController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        detailView.song = self.songController.songs[indexPath.row];
    }
}


@end
