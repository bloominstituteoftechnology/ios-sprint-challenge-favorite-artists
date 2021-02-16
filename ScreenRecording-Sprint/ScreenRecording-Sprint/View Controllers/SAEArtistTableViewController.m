//
//  SAEArtistTableViewController.m
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 11/21/20.
//

#import "SAEArtistTableViewController.h"
#import "SAEDetialArtistViewController.h"
#import "SAEArtist.h"
#import "SAEAudioDBFetcher.h"

@interface SAEArtistTableViewController ()

@property (nonatomic, readonly) SAEAudioDBFetcher *saeAudioDBFetcher;

@end

@implementation SAEArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.saeAudioDBFetcher loadingArtists];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//
//}
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.saeAudioDBFetcher.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"ArtistCell" forIndexPath:indexPath];
    
    SAEArtist *artist = [self.saeAudioDBFetcher.artists objectAtIndex:indexPath.row];
//    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Forme in %i", artist.yearFormed];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        SAEArtist *artist = [self.saeAudioDBFetcher.artists objectAtIndex: indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@""]) {
//        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
//        
//        SAEDetialArtistViewController *artistDetialVC = segue.destinationViewController;
//        
//        artistDetialVC.saeAudioDBFetcher = self.saeAudioDBFetcher;
//        artistDetialVC.artist = [self.saeAudioDBFetcher.artists objectAtIndex:indexPath.row];
//    } else if ([segue.identifier isEqualToString:@""]) {
//        SAEDetialArtistViewController *artistDetialVC = segue.destinationViewController;
//        artistDetialVC.saeAudioDBFetcher = self.saeAudioDBFetcher;
//    }
//}


@end
