//
//  DetailViewController.m
//  Artists
//
//  Created by Alexander Supe on 20.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import "DetailViewController.h"
#import "Artist.h"
#import "ArtistController.h"

@interface DetailViewController ()

@property Artist *artist;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[ArtistController new] getArtist:@"" completion:^(Artist *artist) {
        self.artist = artist;
        NSLog(@"%@", self.artist.name);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
