//
//  SAENewArtistViewController.m
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 11/21/20.
//

#import "SAENewArtistViewController.h"

@interface SAENewArtistViewController ()

@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (strong, nonatomic) IBOutlet UISearchBar *artistSearchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateFormedLabel;
@property (strong, nonatomic) IBOutlet UITextView *artistTextView;

@end

@implementation SAENewArtistViewController

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
- (IBAction)saveButtonTapped:(id)sender {
}

@end
