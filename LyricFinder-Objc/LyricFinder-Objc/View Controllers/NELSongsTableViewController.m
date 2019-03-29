//
//  NELSongsTableViewController.m
//  LyricFinder-Objc
//
//  Created by Nelson Gonzalez on 3/29/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import "NELSongsTableViewController.h"

@interface NELSongsTableViewController ()

@end

@implementation NELSongsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lyricCell" forIndexPath:indexPath];
    
    
    
    return cell;
}



#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
}


@end
