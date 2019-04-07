//
//  LADetailViewController.m
//  LAFavoriteArtists
//
//  Created by Angel Buenrostro on 4/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

#import "LADetailViewController.h"
#import "LAArtist.h"

@interface LADetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;
@end

@implementation LADetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateViews];
}

-(void) updateViews{
    [self.navigationItem setTitle:self.artist.name];
    _nameLabel.text = _artist.name;
    NSString *yearString = [NSString stringWithFormat:@"%d", _artist.year];
    _yearLabel.text = yearString;
    _biographyTextView.text = _artist.biography;
    
}

@end
