//
//  ArtistsTableViewController.m
//  FavoriteArtists(iOS12)
//
//  Created by brian vilchez on 2/21/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//
#import <CoreData/CoreData.h>
#import "ArtistsTableViewController.h"
#import "ArtistDetailViewController.h"
#import "BFVArtistController.h"
#import "BFVArtist+Convenience.h"
@interface ArtistsTableViewController ()

- (void)addArtistWithName:(NSString *)name;
- (void)presentAlertVC;
@end

@implementation ArtistsTableViewController
//MARK: - initializers / lifeCycles
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self tableView]reloadData];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _artistController = [[BFVArtistController alloc]init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        _artistController = [[BFVArtistController alloc]init];
    }
    return self;
}
//MARK: - Actions

- (IBAction)addArtistButtonTapped:(UIBarButtonItem *)sender {
    [self presentAlertVC];
}

//MARK: - helper methods

- (void)addArtistWithName:(NSString *)name {
    [[self artistController] fetchArtistFromApi:name completionHandler:^(NSError * _Nonnull error) {
        if (error) {
            NSLog(@"error fetching artist from api: %@", error);
            return;
        }
       dispatch_async(dispatch_get_main_queue(), ^{
        [[self tableView]reloadData];
        });
    }];
}

- (void)presentAlertVC {
    UIAlertController *alert =  [ UIAlertController alertControllerWithTitle:@"Favorite Artist" message:@"enter artist name" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"enter name";
    }];
    
    UIAlertAction *save = [UIAlertAction actionWithTitle:@"save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textField = alert.textFields.firstObject;
        if(![textField.text isEqualToString:@""]) {
            NSString *name = textField.text;
            [self addArtistWithName: name];
        }
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:save];
    [alert addAction:cancel];
    [self presentViewController:alert animated:true completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return [[[self artistController]artists]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    BFVArtist *artist =[[[self artistController]artists]objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.bandName;
    NSLog(@"%@",artist.bandName);
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ArtistDetailSegue"]) {
        ArtistDetailViewController *artistDetailVC = [segue destinationViewController];
        NSIndexPath *artistIndexPath = [[self tableView]indexPathForSelectedRow];
        artistDetailVC.artist = [[[self artistController]artists]objectAtIndex:artistIndexPath.row];
        artistDetailVC.artistController = [self artistController];
    }
}

@end
