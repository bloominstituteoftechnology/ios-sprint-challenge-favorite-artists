//
//  LASearchViewController.m
//  LAFavoriteArtists
//
//  Created by Angel Buenrostro on 4/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

#import "LASearchViewController.h"
#import "LAArtist.h"
#import "LAArtistController.h"
#import "LAArtistFetcher.h"
#import "LAArtist+NSJSONSerialization.h"

@interface LASearchViewController ()<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (nonatomic) LAArtist *artistToSave;


@end

@implementation LASearchViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:true];
    self.saveButton.enabled = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.searchBar setDelegate:self];
    
    
}
- (IBAction)saveButtonPressed:(id)sender {
    // IMPLEMENT SAVE USING NSFILEMANAGER
    if(self.artistToSave){
        [self saveArtist:_artistToSave];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Artist Saved" message:((void)(@"Successfully saved %@"), _artistToSave.name) preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
                                        style:UIAlertActionStyleDefault
                                                         handler:nil];
        //You can use a block here to handle a press on this button
        [alertController addAction:actionOk];
        [self presentViewController:alertController animated:YES completion:nil];
        self.saveButton.enabled= NO;
    }
    else {
        NSLog(@"Artist to save is Nil");
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    LAArtistFetcher *fetcher = [[LAArtistFetcher alloc]init];
    
    [fetcher fetchArtist:searchBar.text completionBlock:^(LAArtist * artist, NSError * error) {
        if (error){
            NSLog( @"Error fetching %@", error);
            return;
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                // Do UI stuff here
                self.artistToSave = artist;
                [self.navigationItem setTitle:artist.name];
                [self->_biographyTextView setText:artist.biography];
                self.saveButton.enabled = YES;
            });
        }
    }];
    
}

-(void) saveArtist: (LAArtist *)artist{
    if(artist){
        // Turn artist into data that can be saved
        
        NSData *artistData = [NSJSONSerialization dataWithJSONObject:[artist makeArtistDictionary] options:0 error:NULL];
        
        // Get a url to save the data to
        
        NSURL *documentDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        
        // Create a unique URL inside the documentsDirectory for the artist file
        NSURL *artistURL = [[documentDirectory URLByAppendingPathComponent:_artistToSave.name] URLByAppendingPathExtension:@"json"];
        // Write the data to the URL
        
        [artistData writeToURL:artistURL atomically:YES];
        
    } else {
        NSLog(@"There is no valid artist to save");
        return;
    }
    return;
}
@end
