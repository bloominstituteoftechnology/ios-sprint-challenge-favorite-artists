//
//  LSILyricFInderViewController.m
//  LSILyric FInder
//
//  Created by Iyin Raphael on 3/8/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSILyricFInderViewController.h"

@interface LSILyricFInderViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
- (IBAction)addButtonTapped:(UIButton *)sender;
- (IBAction)substractButtonTaped:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistNameTextField;
- (IBAction)searchButtonTapped:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;
- (IBAction)save:(id)sender;

@end

@implementation LSILyricFInderViewController

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

- (IBAction)addButtonTapped:(UIButton *)sender {
}

- (IBAction)substractButtonTaped:(UIButton *)sender {
}
- (IBAction)searchButtonTapped:(UIButton *)sender {
}
- (IBAction)save:(id)sender {
}
@end
