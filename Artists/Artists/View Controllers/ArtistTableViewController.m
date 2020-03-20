//
//  ArtistTableViewController.m
//  Artists
//
//  Created by Alexander Supe on 20.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import "ArtistTableViewController.h"
#import "Artist+Persistance.h"

@interface ArtistTableViewController ()

@property (nonatomic) NSArray *artists;

@end

@implementation ArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _artists = [Artist new].getFromPersistantStore;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Artist *artist = _artists[indexPath.row];
    [cell.textLabel setText:artist.name];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
