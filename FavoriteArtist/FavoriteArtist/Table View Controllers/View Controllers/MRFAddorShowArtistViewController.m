//
//  MRFAddorShowArtistViewController.m
//  PXFavArtist
//
//  Created by Michael Flowers on 7/19/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import "MRFAddorShowArtistViewController.h"
#import "MRFArtist.h"
#import "MRFArtistController.h"
#import "MRFNetworking.h"
@interface MRFAddorShowArtistViewController ()


@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveProperties;

@end

@implementation MRFAddorShowArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateViews];
    _searchBar.delegate = self;
}

- (void)setArtist:(MRFArtist *)artist {
    if (artist != _artist){
        _artist = artist;
        [self updateViews];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"searchbar buttonclicked");
    //TODO - MAKE NETWORK CALL HERE
    NSString *name = searchBar.text;
    MRFNetworking *network = [[MRFNetworking alloc] init];
    [network fetchArtistWithName:name completionBlock:^(MRFArtist * _Nonnull artist, NSError * _Nonnull error) {
        if (error){
            NSLog(@"Error fetching while saving:%@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(),^ {
//            self.title = self.artist.artist;
//            self.nameLabel.text = artist.artist;
//            NSString *yearFormedString = [[NSString alloc] initWithFormat:@"%i", artist.yearFormed];
//            self.yearFormedLabel.text = yearFormedString;
//            self.textView.text = artist.bio;
//            self.searchBar.hidden = YES;
//            self.title = artist.artist;
//            self.view.backgroundColor = [UIColor blueColor];
//            [self.artistContrller createArtistWithName:artist.artist yearFormed:artist.yearFormed bio:artist.bio];
            self.artist = artist;
        });
    }];
}

-(void)updateViews{
    //check to see if view has loaded
    if (!self.isViewLoaded || !self.artist){ return; }
    
    //grab information out of task
    self.title = self.artist.artist;
    self.nameLabel.text = self.artist.artist;
    NSString *yearFormedString = [[NSString alloc] initWithFormat:@"%i", self.artist.yearFormed];
    self.yearFormedLabel.text = yearFormedString;
    self.textView.text = self.artist.bio;
    self.searchBar.hidden = YES;
//    self.saveProperties.enabled = NO;
    
}

- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender {
    
    BOOL isNewArtist = self.artist == nil;
    MRFArtist *artist = isNewArtist ? [[MRFArtist alloc]init] : self.artist;
    
    // TODO SAVE ARTIST
     [_artistContrller createArtistWithName:artist.artist yearFormed:artist.yearFormed  bio:artist.bio];

    NSLog(@"This was the artist we just created:%@", artist.bio);
}
@end
