//
//  LSCTableViewController.m
//  ios-sprint-11
//
//  Created by David Doswell on 10/5/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

#import "LSCTableViewController.h"
#import "LSCSong.h"
#import "LSCSongController.h"

@interface LSCTableViewController ()

@end

@implementation LSCTableViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _songController = [[LSCSongController alloc] init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _songController = [[LSCSongController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[[self songController]songs] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSArray *songs = [[self songController] songs];
    
    LSCSong *song = [songs objectAtIndex:[indexPath row]];
    
    [[cell textLabel] setText:[song songTitle]];
    [[cell detailTextLabel] setText:[song artistName]];

    return cell;
}

@end
