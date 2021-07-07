//
//  SongsTableViewController.m
//  Lyric Finder
//
//  Created by Moin Uddin on 11/16/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

#import "SongsTableViewController.h"
#import "Song.h"
#import "SongDetailViewController.h"
@interface SongsTableViewController ()

@end

@implementation SongsTableViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _songController = [[SongController alloc] init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _songController = [[SongController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.songController loadSongs];
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [[self tableView] reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songController.songs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    Song *song = [self.songController.songs objectAtIndex:indexPath.row];
    
    [[cell textLabel] setText: song.title];
    [[cell detailTextLabel] setText: song.artist];
    return cell;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"NewSong"]) {
        SongDetailViewController *vc = [segue destinationViewController];
        
        [vc setSongController: self.songController];
    } else if ([segue.identifier isEqualToString:@"ViewSong"]) {
        SongDetailViewController *vc = [segue destinationViewController];
        [vc setSongController: self.songController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Song *song = [self.songController.songs objectAtIndex:indexPath.row];
        [vc setSong:song];
    }
}


@end
