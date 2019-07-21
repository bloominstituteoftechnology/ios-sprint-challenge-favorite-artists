//
//  TXCArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Thomas Cacciatore on 7/19/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

#import "TXCArtistTableViewController.h"
#import "TXCArtistController.h"
#import "TXCArtist.h"

@interface TXCArtistTableViewController ()

@end

@implementation TXCArtistTableViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _artistController = [[TXCArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _artistController = [[TXCArtistController alloc] init];
//
//    [_artistController fetchArtistWithName:@"All time low" completionBlock:^(NSArray * _Nonnull artists, NSError * _Nonnull error) {
//
//        if (error) {
//            NSLog(@"Error: %@", error);
//            return;
//        }
//        for (TXCArtist *artist in artists) {
//            NSLog(@"Artist: \n%@", artist.name);
//        }
//    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // update view with array of saved artists from persistent store?
    [self.tableView reloadData];
    
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.artistController.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    TXCArtist *artist = self.artistController.artists[indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%li", (long)artist.dateFormed];
    
    return cell;
}


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
