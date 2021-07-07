//
//  IACLyricsTableViewController.m
//  Lyric Finder Async
//
//  Created by Ivan Caldwell on 3/8/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import "IACLyricsTableViewController.h"
#import "IACLyricsQueryViewController.h"
#import "IACLyricsDetailViewController.h"
#import "IACLyricsController.h"


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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lyricsController.songs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LyricCell" forIndexPath:indexPath];
    
    IACLyrics *song = self.lyricsController.songs[indexPath.row];
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = song.artist;
    
    return cell;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        IACLyrics *song = self.lyricsController.songs[indexPath.row];
        [self.lyricsController deleteLyric: song];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"AddLyric"]){
        IACLyricsQueryViewController *destinationVC = segue.destinationViewController;
        
        [destinationVC setLyricsController: _lyricsController];
    } else if ([segue.identifier  isEqual: @"ShowLyric"]) {
        IACLyricsDetailViewController *destinationVC = segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        IACLyrics *song = self.lyricsController.songs[indexPath.row];
        
        destinationVC.lyricsController = self.lyricsController;
        destinationVC.song = song;
    }
}

@end
