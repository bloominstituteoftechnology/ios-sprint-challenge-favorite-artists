//
//  IACLyricsTableViewController.m
//  Lyric Finder Async III
//
//  Created by Ivan Caldwell on 3/10/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import "IACLyricsTableViewController.h"
#import "IACLyricsQueryViewController.h"
#import "IACLyricsDetailViewController.h"
#import "IACLyricsController.h"
#import "IACSong.h"

@interface IACLyricsTableViewController ()
@property IACLyricsController *lyricsController;
@end

@implementation IACLyricsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLyricsController:[[IACLyricsController alloc] init]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.lyricsController.songs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    IACSong *song = self.lyricsController.songs[indexPath.row];
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = song.artist;
    return cell;
}




// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        IACSong *song = self.lyricsController.songs[indexPath.row];
        [self.lyricsController deleteSong: song];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"AddLyrics"]){
        IACLyricsQueryViewController *destinationVC = segue.destinationViewController;
        destinationVC.lyricsController = self.lyricsController;
    } else if ([segue.identifier  isEqual: @"ShowLyrics"]) {
        IACLyricsDetailViewController *destinationVC = segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        IACSong *song = self.lyricsController.songs[indexPath.row];
        destinationVC.song = song;
    }
}


@end
