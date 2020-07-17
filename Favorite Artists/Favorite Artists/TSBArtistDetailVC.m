//
//  TSBArtistDetailVC.m
//  Favorite Artists
//
//  Created by Thomas Sabino-Benowitz on 7/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "TSBArtistDetailVC.h"

@interface TSBArtistDetailVC ()

@property (weak, nonatomic) IBOutlet UITextView *bioTextView;

@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

- (void)saveToPersistentStore;
- (void)updateViews;

@end

@implementation TSBArtistDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)updateViews {
    if ([self artist]) {
        
        [[self artistLabel] setText: self.artist.name];
        [[self navigationItem] setTitle: self.artist.name];
        
        NSNumber *year = [NSNumber numberWithInteger: self.artist.yearFormed];
        [[self formedYearLabel] setText: year.stringValue];
        [[self biographyTextView] setText: self.artist.biography];
        
    } else {
        [[self artistLabel] setText: @""];
        [[self formedYearLabel] setText: @""];
        [[self biographyTextView] setText: @""];
        [[self navigationItem] setTitle:@"Add New Artist"];
    }
}

- (void)saveToPersistentStore {
    NSDictionary *artistDictionary = [[self artist] dictionaryRep];
    NSMutableArray *arrayOfDictionaries;
    
    if ([self artists]) {
        arrayOfDictionaries = [[NSMutableArray alloc] init];
        for (JDFArtist *artist in self.artists) {
            NSDictionary *artistDictionary = [artist dictionaryRep];
            [arrayOfDictionaries addObject:artistDictionary];
        }
        [arrayOfDictionaries addObject:artistDictionary];
    } else {
        arrayOfDictionaries = [[NSMutableArray alloc] initWithObjects:artistDictionary, nil];
    }
    
    NSArray *artistsArray = [[NSArray alloc] initWithArray:arrayOfDictionaries];
    NSDictionary *artistsDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:artistsArray, @"artists", nil];
    NSError *jsonError;
    NSData *artistsData = [NSJSONSerialization dataWithJSONObject:artistsDictionary options:0 error:&jsonError];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *docsDirectory =  [fileManager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    NSURL *path = [[docsDirectory URLByAppendingPathComponent:@"artists"] URLByAppendingPathExtension:@"json"];
    [artistsData writeToURL:path atomically:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender {
    
    [self saveToPersistentStore];
    
    [[self navigationController] popToRootViewControllerAnimated:YES];
}

@end
