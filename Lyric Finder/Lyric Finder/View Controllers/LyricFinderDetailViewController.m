//
//  LyricFinderDetailViewController.m
//  Lyric Finder
//
//  Created by Ivan Caldwell on 3/1/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import "LyricFinderDetailViewController.h"

@interface LyricFinderDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;


@end

@implementation LyricFinderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
