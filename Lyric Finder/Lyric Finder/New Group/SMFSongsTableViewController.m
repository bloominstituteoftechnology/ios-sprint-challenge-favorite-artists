//
//  SMFSongsTableViewController.m
//  Lyric Finder
//
//  Created by Samantha Gatt on 10/5/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import "SMFSongsTableViewController.h"

@interface SMFSongsTableViewController ()

@end

@implementation SMFSongsTableViewController

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    
    
    return cell;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
