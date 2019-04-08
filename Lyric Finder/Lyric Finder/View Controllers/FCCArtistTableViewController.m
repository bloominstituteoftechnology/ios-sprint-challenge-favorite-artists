//
//  FCCArtistTableViewController.m
//  Lyric Finder
//
//  Created by Lambda_School_Loaner_34 on 4/5/19.
//  Copyright © 2019 Frulwinn. All rights reserved.
//

#import "FCCArtistTableViewController.h"
#import "FCCArtistController.h"
#import "FCCArtist.h"
#import "FCCArtistDetailViewController.h"

@interface FCCArtistTableViewController ()

@end

@implementation FCCArtistTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.artistController artists] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artistCell" forIndexPath:indexPath];
    
    FCCArtist *artist = self.artistController.artists[indexPath.row];
    cell.textLabel.text = artist.artist;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %ld", (long)artist.year];
    
    return cell;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  
    if ([segue.identifier isEqualToString:@"artistSegue"])
    {
        FCCArtistDetailViewController *destination = segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        
        destination.artistController  = self.artistController;
        destination.artist = self.artistController.artists[indexPath.row];
        
    } else if ([segue.identifier isEqualToString:@"addSegue"])
    {
        FCCArtistDetailViewController *destination = segue.destinationViewController;
        destination.artistController = self.artistController;
        
    }
}

@synthesize artistController = _artistController;
- (FCCArtistController *)artistController
{
    if (!_artistController)
    {
        _artistController = [[FCCArtistController alloc] init];
    }
    return _artistController;
}

@end
