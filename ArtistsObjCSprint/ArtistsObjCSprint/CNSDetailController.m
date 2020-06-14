//
//  CNSDetailController.m
//  ArtistsObjCSprint
//
//  Created by Ezra Black on 6/13/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import "CNSDetailController.h"
#import "CNSArtistModel.h"
#import "CNSArtistController.h"
#import "CNSArtistModel+ArtistSerialization.h"

@interface CNSDetailController ()
@property (strong, nonatomic) IBOutlet UISearchBar *artistSearchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistName;
@property (strong, nonatomic) IBOutlet UILabel *yearFormed;
@property (strong, nonatomic) IBOutlet UITextView *bioTextView;@end
@implementation CNSDetailController
- (void)viewDidLoad {
    [super viewDidLoad];
    _artistSearchBar.delegate = self;
    [self updateViews];
}

-(void)saveArtist:(CNSArtistModel *)artistRetrieved {
    if (artistRetrieved) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:[artistRetrieved artistData] options:0 error:nil];
        NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        NSURL *url = [[directory URLByAppendingPathComponent:self.artist.artistName] URLByAppendingPathExtension:@"json"];
        [data writeToURL:url atomically:YES];
    } else {
        NSLog(@"Error saving new artist");
        return;
    }
    return;
}



- (IBAction)saveTapped:(id)sender {
  if (self.artist) {
        [self saveArtist:self.artist];
        [self.navigationController popToRootViewControllerAnimated:true];
    } else {
        NSLog(@"Invalid Arist");
    }
}


-(void)updateViews {
    if (!self.isViewLoaded || !self.artist) {return;}
    self.artistName.text = self.artist.artistName;
    self.bioTextView.text = self.artist.artistBio;
    self.yearFormed.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.artist.formedYear];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    self.artistName.text = [NSString stringWithFormat:@" Waiting for %@", searchBar.text];
    
  [self.controller fetchArtistWithName:searchBar.text completionBlock:^(CNSArtistModel *receivedArtist, NSError *error) {
        if (error) {
            NSLog(@"Unable to fetch artist");
             dispatch_async(dispatch_get_main_queue(), ^{
            self.artistName.text = @"The artist you entered is not available at this time, try another artist.";
             });
            return;
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.artist = receivedArtist;
                [self updateViews];
                
            });
        }
    }];
}
@end
