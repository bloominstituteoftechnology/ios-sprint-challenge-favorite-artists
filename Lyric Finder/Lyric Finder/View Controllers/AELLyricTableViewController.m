//
//  AELLyricTableViewController.m
//  Lyric Finder
//
//  Created by Andrew Dhan on 10/5/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

#import "AELLyricTableViewController.h"
#import "AELSongController.h"
#import "AELSong.h"
#import "AELDetailViewController.h"

@interface AELLyricTableViewController ()
@property AELSongController *songController;
@property AELSong *song;
@end

@implementation AELLyricTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   _songController = [[AELSongController alloc] init];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[[self songController] songs] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    AELSong *song = [[[self songController] songs] objectAtIndex:indexPath.row];
    [[cell textLabel] setText: [song title]];
    [[cell detailTextLabel] setText: [song artist]];
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AELDetailViewController *destinationVC = (AELDetailViewController *)[segue destinationViewController];
    
    if ([[segue identifier] isEqualToString:@"AddLyric"]){
        destinationVC 
    } else {
        
    }
}


@end
