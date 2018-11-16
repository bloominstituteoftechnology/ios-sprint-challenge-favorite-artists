//
//  IIISongsTableViewController.m
//  Lyric Finder
//
//  Created by Ilgar Ilyasov on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "IIISongsTableViewController.h"
#import "IIISongViewController.h"
#import "IIISongController.h"
#import "IIISong.h"

@interface IIISongsTableViewController ()

@property (nonatomic) IIISongController *songController;

@end

@implementation IIISongsTableViewController

NSString *addSegue = @"AddSegue";
NSString *cellSegue = @"CellSegue";
NSString *reuseIdentifier = @"SongCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
    
    // We can, maybe should use TableViewControllers inits. But I wanted try this one
    _songController = [[IIISongController alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songController.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    IIISong *song = self.songController.songs[indexPath.row];
    
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = song.artist;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:cellSegue]) {
        IIISongViewController *destVC = segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        IIISong *song = self.songController.songs[indexPath.row];
        
        destVC.song = song;
    } else if ([segue.identifier isEqualToString:addSegue]) {
        IIISongViewController *destVC = segue.destinationViewController;
        
        destVC.songController = self.songController;
    }
}

@end
