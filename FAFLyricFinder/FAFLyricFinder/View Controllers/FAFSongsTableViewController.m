//
//  FAFSongsTableViewController.m
//  FAFLyricFinder
//
//  Created by Farhan on 11/16/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

#import "FAFSongsTableViewController.h"
#import "FAFSongController.h"
#import "FAFNewSongViewController.h"

@interface FAFSongsTableViewController ()

@property FAFSongController *songController;

@end

@implementation FAFSongsTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _songController = [[FAFSongController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _songController = [[FAFSongController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self songController] songsReadOnly] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    FAFSong *song = [[[self songController] songsReadOnly] objectAtIndex:indexPath.row];
    
    [[cell textLabel] setText:song.songName];
    [[cell detailTextLabel] setText:song.artist];
    
    
    return cell;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if ([segue.identifier isEqualToString:@"NewSong"]){
        FAFNewSongViewController *destVC = segue.destinationViewController;
        
        destVC.songController = [self songController];
        
        dispatch_async(dispatch_get_main_queue(),
        ^{
            destVC.title = @"New Song";
        });
    }
    
    if ([segue.identifier isEqualToString:@"ViewSong"]){
        FAFNewSongViewController *destVC = segue.destinationViewController;
        
        NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
        
        destVC.song = [[[self songController] songsReadOnly] objectAtIndex:indexPath.row];
        
        dispatch_async(dispatch_get_main_queue(),
        ^{
        destVC.navigationItem.rightBarButtonItem = nil;
//            [destVC updateViews];
        });
    }
    
}


@end
