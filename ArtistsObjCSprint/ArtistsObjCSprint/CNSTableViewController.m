//
//  CNSTableViewController.m
//  ArtistsObjCSprint
//
//  Created by Ezra Black on 6/13/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import "CNSTableViewController.h"
#import "CNSArtistModel.h"
#import "CNSArtistController.h"
#import "CNSDetailController.h"

@interface CNSTableViewController ()
@property NSMutableArray *tempArtists;
@property CNSArtistController *artistController;
@end

@implementation CNSTableViewController
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.artistController = [[CNSArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad:(BOOL)animated {
    [super viewDidLoad];
     [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (!self.artistController) {
        self.artistController = [[CNSArtistController alloc] init];
      self.artist = [[CNSArtistModel alloc] init];
    }
    [self.tempArtists removeAllObjects];
    self.tempArtists = [self.artistController artistArray];
    [self.tableView reloadData];
}




#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tempArtists.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    CNSArtistModel *artist = self.tempArtists[indexPath.row];
    cell.textLabel.text = artist.artistName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)artist.formedYear];
    return cell;
}


//AddArtist
//ShowArtist
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
    if ([segue.identifier isEqualToString:@"ShowArtist"]) {
           NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
           CNSDetailController *detailVC = segue.destinationViewController;
        detailVC.controller = self.artistController;
          detailVC.artist = [self tempArtists][indexPath.row];
       }
       
       if ([segue.identifier isEqualToString:@"AddArtist"]) {
           CNSDetailController *detailVC = segue.destinationViewController;
           detailVC.controller = self.artistController;
       }
    
    
}

@end
