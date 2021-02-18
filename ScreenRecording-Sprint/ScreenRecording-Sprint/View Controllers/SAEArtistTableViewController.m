//
//  SAEArtistTableViewController.m
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 11/21/20.
//

#import "SAEArtistTableViewController.h"
#import "SAEDetialArtistViewController.h"
#import "SAEArtistController.h"
#import "SAEArtist.h"


@implementation SAEArtistTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _artistController = [[SAEArtistController alloc] init];
    [self.artistController loadFromPersistentStore];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.saveArtists.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"ArtistCell" forIndexPath:indexPath];
    SAEArtist *artist = self.artistController.saveArtists[indexPath.row];
    cell.textLabel.text = artist.artistName;
    
    if (artist.formedYear) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed %d", artist.formedYear];
    } else {
        cell.detailTextLabel.text = @"Formed not found";
    }
    
    return  cell;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetialViewControllerSegue"]) {
        SAEDetialArtistViewController *artistDetialVC = (SAEDetialArtistViewController *)segue.destinationViewController;
        
        artistDetialVC.artistController = _artistController;
        artistDetialVC.artist = [_artistController.saveArtists objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        
    } else if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        SAEDetialArtistViewController *artistDetialVC = (SAEDetialArtistViewController *)segue.destinationViewController;
        artistDetialVC.artistController = _artistController;
    }
}


@end
