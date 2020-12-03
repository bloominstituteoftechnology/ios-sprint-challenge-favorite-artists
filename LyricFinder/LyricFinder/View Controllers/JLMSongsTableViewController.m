//
//  JLMSongsTableViewController.m
//  LyricFinder
//
//  Created by Jason Modisett on 1/25/19.
//  Copyright © 2019 Jason Modisett. All rights reserved.
//

#import "JLMSongsTableViewController.h"
#import "JLMSongController.h"
#import "JLMSong.h"
#import "JLMSongDetailsViewController.h"
#import "JLMSongTableViewCell.h"

@interface JLMSongsTableViewController ()

@property (nonatomic) JLMSongController *songController;

@end

@implementation JLMSongsTableViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _songController = [[JLMSongController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _songController = [[JLMSongController alloc] init];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.tableView.rowHeight = 70;
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songController.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JLMSongTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    JLMSong *song = [self.songController.songs objectAtIndex:[indexPath row]];
    
    cell.songTitleLabel.text = song.title;
    cell.artistNameLabel.text = [song.artist uppercaseString];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ViewSong"]) {
        JLMSongDetailsViewController *destinationVC = (JLMSongDetailsViewController *)[segue destinationViewController];
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        JLMSong *song = [self.songController.songs objectAtIndex:[indexPath row]];
        [destinationVC setSong:song];
        [destinationVC setSongController:self.songController];
    } else if ([segue.identifier isEqualToString:@"AddSong"]) {
        JLMSongDetailsViewController *destinationVC = (JLMSongDetailsViewController *)[segue destinationViewController];
        
        [destinationVC setSongController:self.songController];
    }
}

@end
