//
//  IACLyricsDetailViewController.m
//  Lyric Finder Async
//
//  Created by Ivan Caldwell on 3/8/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import "IACLyricsDetailViewController.h"

@interface IACLyricsDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;

@end

@implementation IACLyricsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _songTitleTextField.text = _song.title;
    _artistTextField.text = _song.artist;
    _lyricsTextView.text = _song.lyrics;
    _ratingLabel.text = [NSString stringWithFormat:@"Rating %i", [_song rating]];
    
}

@end
