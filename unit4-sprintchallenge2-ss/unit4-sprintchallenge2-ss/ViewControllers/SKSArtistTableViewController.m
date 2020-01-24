//
//  SKSArtistTableViewController.m
//  unit4-sprintchallenge2-ss
//
//  Created by Lambda_School_Loaner_204 on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "SKSArtistTableViewController.h"
#import "SKSArtistController.h"
#import "SKSArtist.h"
#import "SKSArtistDetailViewController.h"

@interface SKSArtistTableViewController ()

@property (nonatomic, readonly) SKSArtistController *artistController;

@end

@implementation SKSArtistTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _artistController = [[SKSArtistController alloc] init];
    }
    return self;
}

static NSString * const reuseIdentifier = @"ArtistCell";

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];

    SKSArtist *artist = self.artistController.artists[indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [[NSNumber numberWithInt:artist.formedYear] stringValue];
    
    return cell;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SKSArtistDetailViewController *destinationVC = [segue destinationViewController];

    destinationVC.artistController = self.artistController;

    if ([[segue identifier] isEqual:@"ShowDetailArtistSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        destinationVC.artist = self.artistController.artists[indexPath.row];
    }
}


@end
