//
//  CLPArtistInfoViewController.m
//  FavoriteArtists
//
//  Created by Chad Parker on 7/31/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

#import "CLPArtistInfoViewController.h"
#import "CLPArtist.h"

@interface CLPArtistInfoViewController ()

@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *biographyTextView;

@end

@implementation CLPArtistInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.artistNameLabel.text = @"";
    self.yearFormedLabel.text = @"";
}

- (void)setArtist:(CLPArtist *)artist
{
    self.artistNameLabel.text = artist.name;
    self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
    self.biographyTextView.text = artist.biography;
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
