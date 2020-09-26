//
//  JSKArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import "JSKArtistDetailViewController.h"
#import "JSKArtist.h"
#import "JSKArtist+NSJSONSerialization.h"
#import "JSKArtistController.h"

@interface JSKArtistDetailViewController ()

@property (nonatomic) JSKArtist *artist;

@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *artistBioTextView;

@end

@implementation JSKArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews
{
    self.title = _artist.artistName;
    self.artistNameLabel.text = _artist.artistName;
    self.artistBioTextView.text = _artist.artistBio;
    self.yearFormedLabel.text = [NSString stringWithFormat:@"Year formed in: %@", _artist.yearFormed];
}
@end
