//
//  GLIArtistDetailTableViewController.m
//  FavoriteArtists
//
//  Created by Julian A. Fordyce on 4/6/19.
//  Copyright © 2019 Julian A. Fordyce. All rights reserved.
//

#import "GLIArtistDetailTableViewController.h"
#import "GLIArtistDetailController.h"
#import "GLIArtistDetail.h"

@interface GLIArtistDetailTableViewController ()

@end

@implementation GLIArtistDetailTableViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _detailController = [[GLIArtistDetailController alloc] init];
    }
    
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _detailController = [[GLIArtistDetailController alloc] init];
    }
    return self;
}


- (void)viewDidLoad
{
    
}




#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[self detailController] artistDetails] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    GLIArtistDetail *
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
