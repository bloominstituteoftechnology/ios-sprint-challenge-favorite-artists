//
//  MKJViewArtistViewController.m
//  FavoriteArtists
//
//  Created by Kenneth Jones on 12/3/20.
//

#import "MKJViewArtistViewController.h"

@interface MKJViewArtistViewController ()

@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *biographyLabel;

@end

@implementation MKJViewArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _artistLabel.text = _artist.artist;
    _yearLabel.text = [NSString stringWithFormat:@"Formed in %i", _artist.year];
    _biographyLabel.text = _artist.biography;
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
