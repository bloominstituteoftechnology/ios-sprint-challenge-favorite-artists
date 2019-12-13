//
//  HHSearchViewController.m
//  Artist
//
//  Created by Hayden Hastings on 7/19/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

#import "HHSearchViewController.h"
#import "HHArtist.h"
#import "HHArtistController.h"
#import "HHArtist+HHJSONSerialization.h"

@interface HHSearchViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation HHSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.saveButton.enabled = NO;
}

- (void)saveArtist:(HHArtist *)artist {
    if (artist) {
        NSData *artistData = [NSJSONSerialization dataWithJSONObject:[artist makeArtistDictionary] options:0 error:nil];
        
        NSURL *documentDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        
        NSURL *artistURL = [[documentDirectory URLByAppendingPathComponent:_artistToSave.name] URLByAppendingPathExtension:@"json"];
        
        [artistData writeToURL:artistURL atomically:YES];
    } else {
        NSLog(@"There is no valid artist to save");
        return;
    }
    return;
}

- (IBAction)saveButtonTapped:(id)sender {
    if (self.artistToSave) {
        [self saveArtist:_artistToSave];
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Artist Saved" message:((void)(@"Successfully saved %@"), _artistToSave.name) preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok"
//                                                           style:UIAlertActionStyleDefault
//                                                         handler:nil];
//        //You can use a block here to handle a press on this button
//        [alertController addAction:actionOk];
//        [self presentViewController:alertController animated:YES completion:nil];
        [self.navigationController popViewControllerAnimated:YES];
        self.saveButton.enabled= NO;
    }
    else {
        NSLog(@"Artist to save is Nil");
    }
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    HHArtistController *fetchArtist = [[HHArtistController alloc] init];
    
    [fetchArtist fetchArtist:searchBar.text completionBlock:^(HHArtist * artist, NSError * error) {
        if (error) {
            NSLog(@"Error fetching %@", error);
            return;
        } else {
            dispatch_async(dispatch_get_main_queue(), ^ {
                self.artistToSave = artist;
                [self.navigationItem setTitle:artist.name];
                [self -> _nameLabel setText:artist.name];
                self.yearLabel.text = [NSString stringWithFormat:@"Formed %d", artist.yearFormed];
                [self -> _biographyTextView setText:artist.biography];
                self.saveButton.enabled = YES;
            });
        }
    }];
}

@end
