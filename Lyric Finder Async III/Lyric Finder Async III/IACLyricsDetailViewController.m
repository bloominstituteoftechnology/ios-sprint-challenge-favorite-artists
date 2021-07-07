//
//  IACLyricsDetailViewController.m
//  Lyric Finder Async III
//
//  Created by Ivan Caldwell on 3/10/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import "IACLyricsDetailViewController.h"

@interface IACLyricsDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;

@end

@implementation IACLyricsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleLabel.text = [NSString stringWithFormat:@"Title: %@", _song.title];
    _artistLabel.text = [NSString stringWithFormat:@"Artist: %@", _song.artist];
    _lyricsTextView.text = _song.lyrics;
    _ratingLabel.text = [NSString stringWithFormat:@"Rating: %i", [_song rating]];
    self.title = _song.title;
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
