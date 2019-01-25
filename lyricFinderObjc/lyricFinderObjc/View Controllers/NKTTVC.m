//
//  NKTTVC.m
//  lyricFinderObjc
//
//  Created by Nikita Thomas on 1/25/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import "NKTTVC.h"
#import "NKTSongController.h"
#import "NKTSongVC.h"
#import "NKTSong.h"

@interface NKTTVC ()

@property NKTSongController *songController;

@end

@implementation NKTTVC


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _songController = [[NKTSongController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _songController = [[NKTSongController alloc] init];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
    [self.songController loadSongs];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[[self songController]songsProperty]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NKTSong *song = [[[self songController] songsProperty] objectAtIndex:indexPath.row];
    
    [[cell textLabel] setText:song.title];
    [[cell detailTextLabel] setText:song.artist];
    
    return cell;
}



#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"toNewSong"]){
        NKTSongVC *destVC = segue.destinationViewController;
        
        destVC.songController = [self songController];

    }
    
    if ([segue.identifier isEqualToString:@"toDetail"]){
        NKTSongVC *destVC = segue.destinationViewController;
        
        NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
        
        destVC.song = [[[self songController] songsProperty] objectAtIndex:indexPath.row];
 
    }
}


@end
