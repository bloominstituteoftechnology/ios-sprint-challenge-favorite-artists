//
//  YZISongsDetailViewController.m
//  Lyrics-Finder
//
//  Created by Yvette Zhukovsky on 1/25/19.
//  Copyright © 2019 Yvette Zhukovsky. All rights reserved.
//

#import "YZISongsDetailViewController.h"

@interface YZISongsDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;
@property (weak, nonatomic) IBOutlet UITextField *songName;
@property (weak, nonatomic) IBOutlet UITextField *artistName;
@property (weak, nonatomic) IBOutlet UIButton *searchLyricsButton;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;


@end

@implementation YZISongsDetailViewController

- (IBAction)ratingsStepper:(id)sender
{
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)searchLyricsEntered:(id)sender
{

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
