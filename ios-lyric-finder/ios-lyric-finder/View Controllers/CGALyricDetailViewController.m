//
//  CGALyricDetailViewController.m
//  ios-lyric-finder
//
//  Created by Conner on 10/5/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import "CGALyricDetailViewController.h"
#import "CGASongController.h"

@interface CGALyricDetailViewController ()

@property CGASongController *songController;
@property (strong, nonatomic) IBOutlet UITextField *songNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *artistTextField;
@property (strong, nonatomic) IBOutlet UITextView *lyricsTextView;
- (IBAction)searchForLyricsTapped:(id)sender;

@end

@implementation CGALyricDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.songController = [[CGASongController alloc] init];
}

- (IBAction)searchForLyricsTapped:(id)sender {
    NSString *artistName = [[self artistTextField] text];
    NSString *track = [[self songNameTextField] text];
    
    [[self songController] searchForSongWithArtist:artistName track:track completion:^(NSString * songWithLyrics, NSError * error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self lyricsTextView] setText:songWithLyrics];
        });
    }];
}

@end
