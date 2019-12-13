//
//  JLRArtistTableViewController.m
//  FavoriteArtists2
//
//  Created by Jesse Ruiz on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "JLRArtistTableViewController.h"
#import "ViewController.h"
#import "JLRFavoriteArtist2Controller.h"
#import "JLRFavoriteArtists2+Convenience.h"

@interface JLRArtistTableViewController ()

@end

@implementation JLRArtistTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _artistController = [[JLRFavoriteArtist2Controller alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _artistController = [[JLRFavoriteArtist2Controller alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artistCell" forIndexPath:indexPath];
    
    Artist *artist = self.artistController.artists[indexPath.row];
    
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %@", artist.formed];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Artist *artist = self.artistController.artists[indexPath.row];
        
        [self.artistController deleteArtist:artist];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowArtist"]) {
        ViewController *destinationVC = (ViewController *)[segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Artist *artist = self.artistController.artists[indexPath.row];
        
        destinationVC.artist = artist;
        destinationVC.artistController = self.artistController;
    } else if ([segue.identifier isEqualToString:@"AddArtist"]) {
        ViewController *destinationVC = (ViewController *)[segue destinationViewController];
        destinationVC.artistController = self.artistController;
    }
}


@end
