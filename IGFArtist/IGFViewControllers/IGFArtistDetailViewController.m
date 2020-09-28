//
//  IGFArtistDetailViewController.m
//  IGFArtist
//
//  Created by Ian French on 9/27/20.
//

#import "IGFArtistDetailViewController.h"
#import "IGFArtist.h"


@interface IGFArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;

- (void)updateViews;

@end

@implementation IGFArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews {
    if (self.artist) {
        self.title = self.artist.name;
        self.yearFormedLabel.text = [NSString stringWithFormat:@"Circa: %@",
    [self.artist formedYearString]];
        self.bioTextView.text = self.artist.biography;
    }
}

@end



