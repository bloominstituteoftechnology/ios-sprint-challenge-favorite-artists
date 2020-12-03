//
//  SLBLyricTableViewController.m
//  Lyric Finder
//
//  Created by Scott Bennett on 11/16/18.
//  Copyright © 2018 Scott Bennett. All rights reserved.
//

#import "SLBLyricTableViewController.h"

@interface SLBLyricTableViewController ()

@end

@implementation SLBLyricTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
    

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}




#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}


@end
