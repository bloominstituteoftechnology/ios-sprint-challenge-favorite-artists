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
#import "BFVArtist.h"
#import "BFVArtistController.h"
#import "CoreDataStack.h"

@interface ArtistsTableViewController () <NSFetchedResultsControllerDelegate>

@property(nonatomic) BFVArtistController *artistController;
@property(strong, nonatomic) NSFetchedResultsController *fetchController;

- (void)addArtistWithName:(NSString *)name;
- (void)presentAlertVC;
@end

@implementation ArtistsTableViewController
//MARK: - initializers / lifeCycles
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureFetchResultsController];
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

- (void)configureFetchResultsController {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Artist"];
    [fetchRequest setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"bandName" ascending:true]]];
    NSManagedObjectContext *context = CoreDataStack.coreDataStack.context;
    self.fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    self.fetchController.delegate = self;
    
    NSError *error = nil;
    [[self fetchController]performFetch:&error];
    
    if(error){
        NSLog(@"failed to perform fetchRequest %@", error);
    }
    
}

- (void)addArtistWithName:(NSString *)name {
    [[self artistController] addArtistWithName:name];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[[self artistController] artists]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    BFVArtist *artist = [[self fetchController]objectAtIndexPath:indexPath];
// cell.textLabel.text = artist.bandName;
//   cell.detailTextLabel.text = artist.yearFormed;
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        BFVArtist *artist = [[[self artistController]artists]objectAtIndex:indexPath.row];
        [[self artistController] deleteArtist:artist];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ArtistDetailSegue"]) {
        ArtistDetailViewController *artistDetailVC = [segue destinationViewController];
        NSIndexPath *artistIndexPath = [[self tableView]indexPathForSelectedRow];
        artistDetailVC.artist = [[self fetchController]objectAtIndexPath:artistIndexPath];
        artistDetailVC.artistController = [self artistController];
    }
}


@end
