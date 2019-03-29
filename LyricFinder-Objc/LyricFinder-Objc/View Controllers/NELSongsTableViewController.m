//
//  NELSongsTableViewController.m
//  LyricFinder-Objc
//
//  Created by Nelson Gonzalez on 3/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import "NELSongsTableViewController.h"
#import "NELLyricsSearchViewController.h"
#import "NELLyricController.h"
#import "NELLyric.h"

@interface NELSongsTableViewController ()

@end

@implementation NELSongsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: YES];
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.lyricController.songs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lyricCell" forIndexPath:indexPath];
    
    NELLyric *songs = self.lyricController.songs[indexPath.row];
    cell.textLabel.text = songs.title;
    cell.detailTextLabel.text = songs.artist;
    
    
    return cell;
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"fromCell"]) {
        //Passing the task and task controller
        NELLyricsSearchViewController *destinationVC = segue.destinationViewController;
        
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        
        destinationVC.lyricController = self.lyricController;
        destinationVC.song = self.lyricController.songs[indexPath.row];
    } else if ([segue.identifier isEqualToString:@"fromBarButton"]) {
        
        //Create a task only need task controller.
        NELLyricsSearchViewController *destinationVC = segue.destinationViewController;
        destinationVC.lyricController = self.lyricController;
    }
}


@synthesize lyricController = _lyricController;

//the getter for lyricController
- (NELLyricController *)lyricController
{
    if (!_lyricController) {
        _lyricController = [[NELLyricController alloc] init];
    }
    return _lyricController;
}

@end
